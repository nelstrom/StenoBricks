require 'rspec'
require_relative '../lib/steno'

module Steno
  describe 'Steno' do
    let(:registry) { double("BrickRegistry") }
    let(:mapper)   { double('BrickMapper') }
    let(:start_z) { Brick.new('start-z', 'z',   [1, 10]) }
    let(:start_d) { Brick.new('start-d', 'd',   [2, 3]) }
    let(:start_b) { Brick.new('start-b', 'b',   [4, 5]) }
    let(:star)    { Brick.new('star', '*',   [10]) }
    let(:soft_a)  { Brick.new('soft-a', 'a',   [8]) }
    let(:soft_e)  { Brick.new('soft-e', 'e',   [11]) }
    let(:end_b)   { Brick.new('end-b', 'b',  [16]) }
    let(:end_g)   { Brick.new('end-g', 'g',  [18]) }
    let(:end_th)  { Brick.new('end-th', 'th',  [10, 19]) }
    let(:end_nch) { Brick.new('end-nch', 'nch', [13, 14, 15, 16]) }

    describe '#Brick' do
      it 'returns Brick instances unchanged' do
        expect(Steno::Brick(start_d)).to eql(start_d)
      end
      it 'instantiates a Brick from Hash values' do
        expect(Steno::Brick({'id' => 'start-d', 'label' => 'd', 'keystrokes' => [2, 3]})).to eql(start_d)
      end
      it 'instantiates a Brick from individual arguments' do
        expect(Steno::Brick('start-d', 'd', [2, 3])).to eql(start_d)
      end
    end

    describe Brick do
      context 'with one keystroke, 2 units wide' do
        subject { star }
        it 'spans a range covering two units' do
          expect(subject.span).to eql({start: 12, width: 2})
        end
        it 'returns matchers labelled dark/light' do
          expect(subject.matchers).to eql([
            {start: 12, width: 2, shade: 'light'}
          ])
        end
        it 'returns the text label' do
          expect(subject.label).to eql('*')
        end

        it '#midpoint returns the midpoint' do
          expect(subject.midpoint).to eql(13.0)
        end

      end

      context 'with two keystrokes, including the * key (2 units wide)' do
        subject { end_th }

        it 'spans a range covering intermediate keys' do
          expect(subject.span).to eql({start: 12, width: 11})
        end
        it 'returns matchers labelled dark/light' do
          expect(subject.matchers).to eql([
            {start: 12, width: 2, shade: 'light'},
            {start: 22, width: 1, shade: 'dark'},
          ])
        end
        it 'returns the text label' do
          expect(subject.label).to eql('th')
        end
        it '#midpoint returns the midpoint' do
          expect(subject.midpoint).to eql(17.5)
        end

      end

      context 'with four keystrokes' do
        subject { end_nch }

        it 'spans a range covering intermediate keys' do
          expect(subject.span).to eql({start: 16, width: 4})
        end

        it 'returns matchers labelled dark/light' do
          expect(subject.matchers).to eql([
            {start: 16, width: 1, shade: 'dark'},
            {start: 17, width: 1, shade: 'light'},
            {start: 18, width: 1, shade: 'dark'},
            {start: 19, width: 1, shade: 'light'},
          ])
        end

        it 'returns the text label' do
          expect(subject.label).to eql('nch')
        end

        it '#midpoint returns the point between start and end' do
          expect(subject.midpoint).to eql(18.0)
        end

      end

    end

    describe FoundationBrick do
      context 'on the left side of the keyboard' do
        subject(:start_z) { FoundationBrick.new('start-z', 'z', [1, 10], soft_a, :left) }

        it '#cover records the leftmost overlay brick' do
          expect(start_z.cover).to eql(soft_a)
        end

        it '#midpoint is adjusted to accommodate the cover brick' do
          expect(start_z.midpoint).to eql(6.0)
        end
      end

      context 'on the right side of the keyboard' do
        subject(:end_th)  { FoundationBrick.new('end-th', 'th', [10, 19], soft_e) }

        it '#cover records the rightmost overlay brick' do
          expect(end_th.cover).to eql(soft_e)
        end

        it '#midpoint is adjusted to accommodate the cover brick' do
          expect(end_th.midpoint).to eql(19.0)
        end
      end
    end

    describe BrickRegistry do
      context 'a fresh BrickRegistry with nothing in it' do
        subject{ BrickRegistry.new }
        it '#add generates a Brick and returns it' do
          brick = subject.add('id' => 'start-b', 'label' => 'b', 'keystrokes' => [4, 5])
          expect(brick).to eql(start_b)
        end
      end

      context 'a BrickRegistry containing some bricks' do
        subject{ BrickRegistry.new([
          { 'id' => 'start-b', 'label' => 'b', 'keystrokes' => [4, 5] }
        ]) }
        it '#lookup finds things by id' do
          brick = subject.lookup("start-b")
          expect(brick).to eql(start_b)
        end
      end
    end

    describe Stroke do
      describe 'construction' do
        before do
          allow(registry).to receive(:lookup).with('soft-e').and_return(soft_e)
          allow(registry).to receive(:lookup).with('start-b').and_return(start_b)
          allow(registry).to receive(:lookup).with('end-nch').and_return(end_nch)
        end
        it 'can be constructed with [Brick] list or [string_id] list with a registry' do
          one = Stroke.new(['start-b', 'soft-e', 'end-nch'], registry)
          two = Stroke.new([start_b, soft_e, end_nch])
          expect(one).to eql(two)
        end
      end

      describe '#notation' do
        subject(:bench) { Stroke.new([start_b, soft_e, end_nch], registry, mapper) }
        before do
          allow(mapper).to receive(:lookup)
            .with(['start-b', 'soft-e', 'end-nch'])
            .and_return('pwefrpb')
        end
        it 'uses mapper to look up notation' do
          expect(bench.notation).to eql('pwefrpb')
        end
      end

      context "given bricks in wrong order" do
        subject{ Stroke.new([soft_e, start_b, end_nch]) }

        it '#bricks returns bricks with correct order' do
          expect(subject.bricks).to eql([start_b, soft_e, end_nch])
        end
      end

      context "with bricks that don't overlap" do
        subject{ Stroke.new([start_b, soft_e, end_nch]) }

        it '#bricks returns a list of bricks' do
          expect(subject.bricks).to eql([start_b, soft_e, end_nch])
        end

        it '#foundation returns an empty list' do
          expect(subject.foundation).to eql([])
        end

        it '#overlay returns bricks in reverse order' do
          expect(subject.overlay).to eql([end_nch, soft_e, start_b])
        end
      end

      context "with bricks that overlap on right side" do
        subject{ Stroke.new([start_d, soft_e, end_th]) }

        it '#bricks returns a list of bricks' do
          expect(subject.bricks).to eql([start_d, soft_e, end_th])
        end

        it '#foundation returns end_th brick' do
          expect(subject.foundation).to eql([FoundationBrick.new('end-th', 'th', [10, 19], soft_e)])
        end

        it '#overlay returns non-foundation bricks in reverse order' do
          expect(subject.overlay).to eql([soft_e, start_d])
        end
      end

      context "with bricks that overlap on left side" do
        subject{ Stroke.new([start_z, soft_a, end_g]) }

        it '#bricks returns a list of bricks' do
          expect(subject.bricks).to eql([start_z, soft_a, end_g])
        end

        it '#foundation returns start_z brick' do
          expect(subject.foundation).to eql([FoundationBrick.new('start-z', 'z', [1, 10], soft_a, :left)])
        end

        it '#overlay returns non-foundation bricks in reverse order' do
          expect(subject.overlay).to eql([end_g, soft_a])
        end
      end
    end

    describe Definition do
      let(:flat_mono_constructor) { {
        "output": "be",
        "bricks": ["end-b"]
      } }
      subject(:flat_mono) { Definition.new(flat_mono_constructor, registry, mapper) }

      let(:mono_stroke_constructor) { {
        "output": "be",
        "collisions": ["bee"],
        "strokes": [
          { "bricks": ["end-b"] }
        ]
      } }
      subject(:mono_stroke) { Definition.new(mono_stroke_constructor, registry, mapper) }

      let(:two_stroke_constructor) { {
        "output": "being",
        "strokes": [
          { bricks: ["end-b"] },
          { bricks: ["end-g"] }
        ]
      } }
      subject(:two_stroke) { Definition.new(two_stroke_constructor, registry, mapper) }

      before do
        allow(registry).to receive(:lookup).with('end-b').and_return(end_b)
        allow(registry).to receive(:lookup).with('end-g').and_return(end_g)
        allow(mapper).to receive(:lookup).with(['end-b']).and_return('-b')
        allow(mapper).to receive(:lookup).with(['end-g']).and_return('-g')
      end
      it 'can accept "output" and "bricks" for constructor of a mono-stroke definition"' do
        expect(flat_mono.output).to eql('be')
        expect(flat_mono.strokes.count).to eql(1)
      end

      it 'can accept "output" and "strokes" for constructor of a mono-stroke definition"' do
        expect(mono_stroke.output).to eql('be')
        expect(mono_stroke.strokes.count).to eql(1)
      end

      it 'can accept "output" and "strokes" for constructor of a two-stroke definition"' do
        expect(two_stroke.output).to eql('being')
        expect(two_stroke.strokes.count).to eql(2)
      end

      describe '#notation' do
        it 'creates notation from it\'s constituent bricks' do
          expect(mono_stroke.notation).to eql('-b')
          expect(two_stroke.notation).to eql('-b/-g')
        end

        it 'comes with #input alias' do
          expect(mono_stroke.notation).to eql(mono_stroke.input)
          expect(two_stroke.notation).to eql(two_stroke.input)
        end
      end

      describe '#bricks' do
        it 'lists all bricks used by this definition' do
          expect(mono_stroke.bricks).to eql([end_b])
          expect(two_stroke.bricks).to eql([end_b, end_g])
        end
      end

      describe '#to_h' do
        it 'returns a standardized hash' do
          expect(mono_stroke.to_h).to eql({
            "output": "be",
            "input": "-B",
            "collisions": ["bee"],
            "strokes": [
              {
                "bricks": ["end-b"]
              }
            ]
          })
          expect(two_stroke.to_h).to eql({
            "output": "being",
            "input": "-B/-G",
            "strokes": [
              { "bricks": ["end-b"] },
              { "bricks": ["end-g"] }
            ]
          })
        end
      end
    end
  end
end
