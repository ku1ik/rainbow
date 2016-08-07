require_relative 'rainbow/global'
require_relative 'rainbow/legacy'
require_relative 'rainbow/refinement'

module Rainbow
  def self.new
    Wrapper.new(global.enabled)
  end

  self.enabled = false unless STDOUT.tty? && STDERR.tty?
  self.enabled = false if ENV['TERM'] == 'dumb'
  self.enabled = true if ENV['CLICOLOR_FORCE'] == '1'
end
