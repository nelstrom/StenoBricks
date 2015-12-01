require 'pry'
require 'lib/steno'
require 'lib/steno_keyboard'
require 'lib/steno_brick_kit'
require 'lib/homographer'
require 'lib/brick_mapper'

if data.has_key?(:bricks) && data.has_key?(:definitions)
  set :mapper, BrickMapper.new(data.bricks)
  set :brickset, Steno::BrickRegistry.new
  set :definition_list, []
  set :wordset, Hash.new
  set :homograph_dictionary, Homographer.new(data.homographs).dictionary

  data.bricks.each do |brick|
    brickset.add(brick)
  end

  definition_list = data.definitions.sort_by(&:word).map do |definition|
    {
      word: definition.word,
      chord: mapper.lookup(definition.bricks),
      bricks: definition.bricks.map { |name| brickset.lookup(name) }
    }
  end

  definition_list.each do |definition|
    next if definition[:word] == '[' || definition[:word] == ']'
    wordset[definition[:word]] ||= []
    wordset[definition[:word]] << definition
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

if data.has_key? :bricks
  data.bricks.each do |brick|
    definitions = data.definitions.select { |defn| defn.bricks.include?(brick.id) }
    similar = (data.bricks - [brick]).select { |b| b.keystrokes == brick.keystrokes }

    proxy "/bricks/#{brick.id}.svg", "/brick.svg",
      locals: { brick: brick }, ignore: true

    proxy "/bricks/#{brick.id}.html", "/brick.html",
      locals: { brick: brick, definitions: definitions, similar: similar}, ignore: true
  end
end

definition_list.each do |definition|
  synonyms = data.definitions.select { |defn| defn.word == definition[:word] }

  if homograph_words = homograph_dictionary[definition[:word]]
    homographs = homograph_words.flat_map do |word|
      data.definitions.select { |defn| defn.word == word }
    end
  else
    homographs = []
  end

  proxy "/definitions/#{definition[:chord]}.svg", "/definition.svg",
    locals: { definition: definition }, ignore: true

  proxy "/definitions/#{definition[:chord]}.html", "/definition.html",
    locals: { definition: definition, synonyms: synonyms, homographs: homographs }, ignore: true
end

wordset.each_pair do |word, definitions|
  proxy "/words/#{word}.html", "/word.html",
    locals: { word: word, definitions: definitions }, ignore: true
end

set :rootpath, ""

# Uncomment next line to use Pry as a console
# ready { binding.pry }
