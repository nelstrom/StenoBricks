require 'rspec'
require_relative '../lib/steno_keyboard'

module Steno
  describe Keyboard do
    subject { Keyboard.new }

    it '#filter with no args returns all items' do
      expect(subject.filter.length).to eql(23)
    end

    it '#filter with {shade:"dark"} returns matching items' do
      params = { shade: 'dark' }
      expect(subject.filter(params).length).to eql(11)
    end

    it '#filter with {shade:"light"} returns matching items' do
      params = { shade: 'light' }
      expect(subject.filter(params).length).to eql(12)
    end

    it '#filter allows multiple params' do
      params = { shade: 'light', left: 0 }
      expect(subject.filter(params).length).to eql(1)
    end

    it '#filter allows multiple params' do
      params = { shade: 'light', left: 1 }
      expect(subject.filter(params).length).to eql(0)
    end
  end
end
