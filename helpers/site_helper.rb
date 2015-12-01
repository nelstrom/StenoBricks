require 'cgi'

module SiteHelper
  def link_to_definition(definition)
    # mapper and rootpath are set in config.rb
    chord = mapper.lookup(definition.bricks)
    link_to chord, "#{rootpath}/definitions/#{chord}/"
  end

  def link_to_word(word)
    url_safe_word = CGI::escape(word)
    link_to word, "#{rootpath}/words/#{url_safe_word}/"
  end

  def path_to_svg(filename, namespace=nil)
    [
      rootpath,
      namespace,
      "#{filename}.svg"
    ].compact.join("/")
  end
end
