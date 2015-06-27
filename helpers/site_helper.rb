require 'cgi'

module SiteHelper
  def link_to_definition(definition)
    # mapper and rootpath are set in config.rb
    chord = mapper.lookup(definition)
    link_to definition.word, "#{rootpath}/definitions/#{chord}/"
  end

  def link_to_word(word)
    url_safe_word = CGI::escape(word)
    link_to word, "#{rootpath}/words/#{url_safe_word}/"
  end
end
