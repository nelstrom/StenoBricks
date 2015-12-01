require 'cgi'

module SiteHelper
  # Note: rootpath is set in config.rb

  def link_to_definition(definition)
    notation = definition.notation
    link_to notation, "#{rootpath}/definitions/#{notation}/"
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
