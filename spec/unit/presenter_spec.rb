require 'spec_helper'
require 'rainbow/presenter'

module Rainbow
  describe Presenter do

    let(:rainbow_string) { described_class.new('hello') }

    shared_examples_for "rainbow string method" do
      it "wraps the text with a sgr sequence" do
        expect(subject).to eq('[hello]')
      end

      it "returns an instance of Rainbow::Presenter" do
        expect(subject).to be_kind_of(Rainbow::Presenter)
      end
    end

    before do
      allow(StringUtils).to receive(:wrap_with_sgr) { '[hello]' }
    end

    describe '#foreground' do
      subject { rainbow_string.foreground(:arg1, 'arg2') }

      let(:color) { double('color', codes: [1, 2]) }

      before do
        allow(Color).to receive(:build).
          with(:foreground, [:arg1, 'arg2']) { color }
      end

      it_behaves_like "rainbow string method"

      it 'wraps with color codes' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).
          with('hello', [1, 2])
      end
    end

    describe '#background' do
      subject { rainbow_string.background(:arg1, 'arg2') }

      let(:color) { double('color', codes: [1, 2]) }

      before do
        allow(Color).to receive(:build).
          with(:background, [:arg1, 'arg2']) { color }
      end

      it_behaves_like "rainbow string method"

      it 'wraps with color codes' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).
          with('hello', [1, 2])
      end
    end

    describe '#reset' do
      subject { rainbow_string.reset }

      it_behaves_like "rainbow string method"

      it 'wraps with 0 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [0])
      end
    end

    describe '#bright' do
      subject { rainbow_string.bright }

      it_behaves_like "rainbow string method"

      it 'wraps with 1 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [1])
      end
    end

    describe '#italic' do
      subject { rainbow_string.italic }

      it_behaves_like "rainbow string method"

      it 'wraps with 3 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).
          with('hello', [3])
      end
    end

    describe '#underline' do
      subject { rainbow_string.underline }

      it_behaves_like "rainbow string method"

      it 'wraps with 4 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [4])
      end
    end

    describe '#blink' do
      subject { rainbow_string.blink }

      it_behaves_like "rainbow string method"

      it 'wraps with 5 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [5])
      end
    end

    describe '#inverse' do
      subject { rainbow_string.inverse }

      it_behaves_like "rainbow string method"

      it 'wraps with 7 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [7])
      end
    end

    describe '#hide' do
      subject { rainbow_string.hide }

      it_behaves_like "rainbow string method"

      it 'wraps with 8 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [8])
      end
    end

  end
end
