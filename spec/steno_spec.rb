require 'rspec'
require_relative '../lib/steno'

module Steno
  describe Brick do
    context 'with a single keystroke' do
      subject { Brick.new([8]) }

      it 'exposes its keystrokes' do
        expect(subject.keystrokes).to eql([8])
      end
      it 'spans a range covering one key' do
        expect(subject.span).to eql({first: 9, last: 10})
      end
    end

    context 'with two keystrokes, each 1 unit wide' do
      subject { Brick.new([8, 9]) }

      it 'exposes its keystrokes' do
        expect(subject.keystrokes).to eql([8, 9])
      end
      it 'spans a range covering two keys' do
        expect(subject.span).to eql({first: 9, last: 11})
      end
    end

    context 'with one keystroke, 2 units wide' do
      subject { Brick.new([10]) }
      it 'spans a range covering two units' do
        expect(subject.span).to eql({first: 11, last: 13})
      end
    end

    context 'with two keystrokes, including the * key (2 units wide)' do
      subject { Brick.new([10, 19]) }

      it 'exposes its keystrokes' do
        expect(subject.keystrokes).to eql([10, 19])
      end
      it 'spans a range covering intermediate keys' do
        expect(subject.span).to eql({first: 11, last: 22})
      end

    end

  end
end
