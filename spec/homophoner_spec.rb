require 'rspec'
require_relative '../lib/homophoner'

describe Homophoner do
  let(:to_sounds)    { ["to", "two", "too"] }
  let(:there_sounds) { ["there", "they're", "their"] }
  let(:eye_sounds)   { ["I", "eye"] }
  subject { Homophoner.new([to_sounds, there_sounds, eye_sounds]) }

  it '#dictionary returns hash of word keys with a list of their homophones' do
    expect(subject.dictionary).to eql({
      "there"   => ["their", "they're"],
      "their"   => ["there", "they're"],
      "they're" => ["their", "there"],
      "to"      => ["too", "two"],
      "too"     => ["to",  "two"],
      "two"     => ["to",  "too"],
      "I"       => ["eye"],
      "eye"     => ["I"],
    })
  end
end
