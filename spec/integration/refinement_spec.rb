require 'spec_helper'
require 'rainbow'

RSpec.describe 'Rainbow refinement' do
  before do
    require 'rainbow/refinement'
    Rainbow.enabled = true
    
    class ScopeNotIncluded
      def self.red_hello
        'hello'.red
      end
    end

    class ScopeIncluded
      using Rainbow
      def self.red_hello
        'hello'.red
      end

      def self.tomato_hello
        'hello'.tomato
      end
    end
  end

  it 'is not active by default' do
    expect do
      ScopeNotIncluded.red_hello
    end.to raise_error(NoMethodError)
  end

  it 'is available when used' do
    expect(ScopeIncluded.red_hello).to eq(Rainbow('hello').red)
  end

  it 'provides X11 named color methods' do
    expect(ScopeIncluded.tomato_hello).to eq(Rainbow('hello').tomato)
  end

  it 'respects disabled state' do
    Rainbow.enabled = false
    expect(ScopeIncluded.red_hello).to eq('hello')
  end
end
