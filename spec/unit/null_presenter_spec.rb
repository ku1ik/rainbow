require 'spec_helper'
require 'rainbow/null_presenter'

module Rainbow
  describe NullPresenter do

    let(:rainbow_null_string) { described_class.new('hello') }

    shared_examples_for "rainbow null string method" do
      it "doesn't wrap the text with any sgr sequence" do
        expect(subject).to eq('hello')
      end

      it "returns an instance of Rainbow::NullPresenter" do
        expect(subject).to be_kind_of(Rainbow::NullPresenter)
      end
    end

    describe '#foreground' do
      subject { rainbow_null_string.foreground(:arg1, 'arg2') }

      it_behaves_like "rainbow null string method"
    end

    describe '#background' do
      subject { rainbow_null_string.background(:arg1, 'arg2') }

      it_behaves_like "rainbow null string method"
    end

    describe '#reset' do
      subject { rainbow_null_string.reset }

      it_behaves_like "rainbow null string method"
    end

    describe '#bright' do
      subject { rainbow_null_string.bright }

      it_behaves_like "rainbow null string method"
    end

    describe '#italic' do
      subject { rainbow_null_string.italic }

      it_behaves_like "rainbow null string method"
    end

    describe '#underline' do
      subject { rainbow_null_string.underline }

      it_behaves_like "rainbow null string method"
    end

    describe '#blink' do
      subject { rainbow_null_string.blink }

      it_behaves_like "rainbow null string method"
    end

    describe '#inverse' do
      subject { rainbow_null_string.inverse }

      it_behaves_like "rainbow null string method"
    end

    describe '#hide' do
      subject { rainbow_null_string.hide }

      it_behaves_like "rainbow null string method"
    end

  end
end
