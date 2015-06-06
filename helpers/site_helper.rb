module SiteHelper
  def link_to_definition(definition)
    # mapper and rootpath are set in config.rb
    chord = mapper.lookup(definition)
    link_to definition.word, "#{rootpath}/definitions/#{chord}/"
  end
end
