require 'pry'
require 'lib/steno'
require 'lib/steno_keyboard'
require 'lib/steno_brick_kit'
require 'lib/homophoner'
require 'lib/brick_mapper'
require 'lib/diagram_bounds'

if data.has_key?(:bricks) && data.has_key?(:definitions)
  set :mapper, BrickMapper.new(data.bricks)
  set :brickset, Steno::BrickRegistry.new(data.bricks)
  set :definition_list, []
  set :wordset, Hash.new
  set :homophone_dictionary, Homophoner.new(data.homophones).dictionary

  brick_list = data.bricks.map do |data|
    Steno::Brick.new(data.id, data.label, data.keystrokes)
  end

  definition_list = data.definitions.map do |data|
    Steno::Definition.new(data, brickset, mapper)
  end

  definition_list.each do |definition|
    next if definition.output == '[' || definition.output == ']'
    wordset[definition.output] ||= []
    wordset[definition.output] << definition
  end
else
  abort "Cannot build site without data"
end

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

activate :directory_indexes
set :relative_links, true

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
  set :rootpath, "/StenoBricks"
end

# Strange but true: the definition_list and brick_list defined in this file
# are made available to proxy pages, but for some reason they are not
# available to normal pages. That's why we're doing this slightly awkward
# dance to make the definition_list available in the definitions.html page,
# and to make the brick_list available in the bricks.html page
proxy "/definitions.html", "definition-list.html",
  locals: { definitions: definition_list }, ignore: true
proxy "/bricks.html", "brick-list.html",
  locals: { bricks: brick_list }, ignore: true

brick_list.each do |brick|
  definitions = definition_list.select { |defn|
    defn.bricks.map(&:id).include?(brick.id)
  }

  similar = (brick_list - [brick]).select { |b|
    b.keystrokes == brick.keystrokes
  }

  proxy "/bricks/#{brick.id}.svg", "/brick.svg",
    locals: { brick: brick, bounds: DiagramBounds.new }, ignore: true

  proxy "/bricks/#{brick.id}.html", "/brick.html",
    locals: { brick: brick, definitions: definitions, similar: similar}, ignore: true
end

definition_list.each do |definition|
  synonyms = definition_list.select { |defn| defn.output == definition.output }

  if homophone_words = homophone_dictionary[definition.output]
    homophones = homophone_words.flat_map do |output|
      definition_list.select { |defn| defn.output == output }
    end
  else
    homophones = []
  end

  proxy "/definitions/#{definition.notation}.svg", "/definition.svg",
    locals: { definition: definition, bounds: DiagramBounds.new(definition) }, ignore: true

  proxy "/definitions/#{definition.notation}.html", "/definition.html",
    locals: { definition: definition, synonyms: synonyms, homophones: homophones, collisions: definition.collisions }, ignore: true
end

wordset.each_pair do |word, definitions|
  proxy "/words/#{word}.html", "/word.html",
    locals: { word: word, definitions: definitions }, ignore: true
end

set :rootpath, ""

# Uncomment next line to use Pry as a console
# ready { binding.pry }
