require 'spec_helper'
require 'rainbow'

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
end

describe 'Rainbow refinement' do

  it 'is not active by default' do
    expect do
      ScopeNotIncluded.red_hello
    end.to raise_error(NoMethodError)
  end

  it 'is available when used' do
    expect(ScopeIncluded.red_hello).to eq(Rainbow('hello').red)
  end

  it 'respects disabled state' do
    Rainbow.enabled = false
    expect(ScopeIncluded.red_hello).to eq('hello')
  end
end
