# frozen_string_literal: true

require_relative 'rainbow/global'

module Rainbow
  def self.new
    Wrapper.new(global.enabled)
  end

  def self.available_colours
    # Using Rainbow... we need to know what colors are available and how are defined
    X11ColorNames::NAMES
  end

  self.enabled = false unless STDOUT.tty? && STDERR.tty?
  self.enabled = false if ENV['TERM'] == 'dumb'
  self.enabled = true if ENV['CLICOLOR_FORCE'] == '1'
end
