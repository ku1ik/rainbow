# frozen_string_literal: true

require_relative 'wrapper'

module Rainbow
  def self.global
    @global ||= Wrapper.new
  end

  def self.enabled
    global.enabled
  end

  # Globally enables/disables Rainbow
  def self.enabled=(value)
    global.enabled = value
  end

  # Globally enables/disables Rainbow for the duration of the block
  #
  # @example
  #   Rainbow.with_enabled(true)  { Rainbow('blue').blue }     # => "\e[34mblue\e[0m"
  #   Rainbow.with_enabled(false) { Rainbow('not blue').blue } # => "not blue"
  #
  def self.with_enabled(enabled)
    orig_enabled, Rainbow.enabled = Rainbow.enabled, enabled # rubocop:disable Style/ParallelAssignment
    yield
  ensure
    Rainbow.enabled = orig_enabled
  end

  # Yields a new Rainbow instance that is enabled/disabled
  #
  # @example
  #   Rainbow.new_with_enabled(true)  { |rainbow| rainbow.wrap('blue').blue }     # => "\e[34mblue\e[0m"
  #   Rainbow.new_with_enabled(false) { |rainbow| rainbow.wrap('not blue').blue } # => "not blue"
  #
  def self.new_with_enabled(enabled)
    instance = Rainbow.new
    instance.enabled = enabled
    yield instance if block_given?
    instance
  end

  def self.uncolor(string)
    StringUtils.uncolor(string)
  end
end

def Rainbow(string)
  Rainbow.global.wrap(string.to_s)
end
