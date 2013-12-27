require 'spec_helper'
require 'rainbow/ext/string'

describe 'String mixin' do

  it 'proxies foreground to Rainbow().foreground' do
    expect('hello'.foreground(:red)).to eq(Rainbow('hello').foreground(:red))
  end

  it 'proxies color to Rainbow().color' do
    expect('hello'.color(:red)).to eq(Rainbow('hello').color(:red))
  end

  it 'proxies colour to Rainbow().colour' do
    expect('hello'.colour(:red)).to eq(Rainbow('hello').colour(:red))
  end

  it 'proxies background to Rainbow().background' do
    expect('hello'.background(:red)).to eq(Rainbow('hello').background(:red))
  end

  it 'proxies bright to Rainbow().bright' do
    expect('hello'.bright).to eq(Rainbow('hello').bright)
  end

  it 'proxies italic to Rainbow().italic' do
    expect('hello'.italic).to eq(Rainbow('hello').italic)
  end

  it 'proxies underline to Rainbow().underline' do
    expect('hello'.underline).to eq(Rainbow('hello').underline)
  end

  it 'proxies blink to Rainbow().blink' do
    expect('hello'.blink).to eq(Rainbow('hello').blink)
  end

  it 'proxies inverse to Rainbow().inverse' do
    expect('hello'.inverse).to eq(Rainbow('hello').inverse)
  end

  it 'proxies hide to Rainbow().hide' do
    expect('hello'.hide).to eq(Rainbow('hello').hide)
  end

  it 'proxies reset to Rainbow().reset' do
    expect('hello'.reset).to eq(Rainbow('hello').reset)
  end

end
