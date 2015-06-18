require 'rspec'
require_relative '../lib/steno'

module Steno
  describe Brick do
    context 'with one keystroke, 2 units wide' do
      subject { Brick.new([10]) }
      it 'spans a range covering two units' do
        expect(subject.span).to eql({start: 11, width: 2})
      end
      it 'returns matchers labelled dark/light' do
        expect(subject.matchers).to eql([
          {index: 10, shade: 'light'}
        ])
      end
    end

    context 'with two keystrokes, including the * key (2 units wide)' do
      subject { Brick.new([10, 19]) }

      it 'spans a range covering intermediate keys' do
        expect(subject.span).to eql({start: 11, width: 11})
      end
      it 'returns matchers labelled dark/light' do
        expect(subject.matchers).to eql([
          {index: 10, shade: 'light'},
          {index: 19, shade: 'dark'},
        ])
      end

    end

    context 'with four keystrokes' do
      subject { Brick.new([13, 14, 15, 16]) }

      it 'spans a range covering intermediate keys' do
        expect(subject.span).to eql({start: 15, width: 4})
      end
      it 'returns matchers labelled dark/light' do
        expect(subject.matchers).to eql([
          {index: 13, shade: 'dark'},
          {index: 14, shade: 'light'},
          {index: 15, shade: 'dark'},
          {index: 16, shade: 'light'},
        ])
      end

    end

  end
end
