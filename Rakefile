require 'middleman-gh-pages'
require_relative 'lib/validator'
require 'json'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)

  task :default => :spec
rescue LoadError
end

desc "Check if any definitions use undefined bricks"
task :validate do
  validator = Validator.new(
    'bricks'      => JSON.parse(File.read('data/bricks.json')),
    'definitions' => JSON.parse(File.read('data/definitions.json')))

  if validator.valid?
    puts "A-OK"
  else
    fail("Undefined bricks: #{validator.undefined_bricks}")
  end
end
