require_relative 'rainbow/global'
require_relative 'rainbow/legacy'

def echo(text)
  system "echo '#{text}'"
end

class String
  def color(text_color)
    Rainbow(self).send(text_color)
  end

  def bold
    Rainbow(self).bold
  end

  def underline
    Rainbow(self).underline
  end

  def faint
    Rainbow(self).faint
  end
end

module Rainbow
  def self.new
    Wrapper.new(global.enabled)
  end

  self.enabled = false unless STDOUT.tty? && STDERR.tty?
  self.enabled = false if ENV['TERM'] == 'dumb'
  self.enabled = true if ENV['CLICOLOR_FORCE'] == '1'
end
