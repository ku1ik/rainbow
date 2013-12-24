require 'spec_helper'
require 'rainbow/wrapper'

module Rainbow
  describe Wrapper do

    let(:wrapper) { described_class.new('hello') }

    shared_examples_for "wrapper method" do
      it "wraps the text with a sgr sequence" do
        expect(subject).to eq('[hello]')
      end

      it "returns an instance of Rainbow::Wrapper" do
        expect(subject).to be_kind_of(Rainbow::Wrapper)
      end

      context "when Rainbow is disabled" do
        before do
          allow(Rainbow).to receive(:enabled) { false }
        end

        it "doesn't wrap the text" do
          expect(subject).to eq('hello')
        end

        it "returns an instance of Rainbow::Wrapper" do
          expect(subject).to be_kind_of(Rainbow::Wrapper)
        end
      end
    end

    before do
      allow(StringUtils).to receive(:wrap_with_sgr) { '[hello]' }
    end

    describe '#foreground' do
      subject { wrapper.foreground(:arg1, 'arg2') }

      let(:color) { double('color', :codes => [1, 2]) }

      before do
        allow(Color).to receive(:build).with(:foreground, [:arg1, 'arg2']) { color }
      end

      it_behaves_like "wrapper method"

      it 'wraps with color codes' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [1, 2])
      end
    end

    describe '#background' do
      subject { wrapper.background(:arg1, 'arg2') }

      let(:color) { double('color', :codes => [1, 2]) }

      before do
        allow(Color).to receive(:build).with(:background, [:arg1, 'arg2']) { color }
      end

      it_behaves_like "wrapper method"

      it 'wraps with color codes' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [1, 2])
      end
    end

    describe '#reset' do
      subject { wrapper.reset }

      it_behaves_like "wrapper method"

      it 'wraps with 0 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [0])
      end
    end

    describe '#bright' do
      subject { wrapper.bright }

      it_behaves_like "wrapper method"

      it 'wraps with 1 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [1])
      end
    end

    describe '#italic' do
      subject { wrapper.italic }

      it_behaves_like "wrapper method"

      it 'wraps with 3 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [3])
      end
    end

    describe '#underline' do
      subject { wrapper.underline }

      it_behaves_like "wrapper method"

      it 'wraps with 4 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [4])
      end
    end

    describe '#blink' do
      subject { wrapper.blink }

      it_behaves_like "wrapper method"

      it 'wraps with 5 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [5])
      end
    end

    describe '#inverse' do
      subject { wrapper.inverse }

      it_behaves_like "wrapper method"

      it 'wraps with 7 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [7])
      end
    end

    describe '#hide' do
      subject { wrapper.hide }

      it_behaves_like "wrapper method"

      it 'wraps with 8 code' do
        subject
        expect(StringUtils).to have_received(:wrap_with_sgr).with('hello', [8])
      end
    end

  end
end
