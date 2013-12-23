require 'rainbow/wrapper'
require 'rainbow/string'

module Rainbow
  class << self; attr_accessor :enabled; end
  @enabled = true
end

def Rainbow(string)
  Rainbow::Wrapper.new(string.to_s)
end

unless STDOUT.tty? && STDERR.tty?
  Rainbow.enabled = false
end

if ENV['TERM'] == 'dumb'
  Rainbow.enabled = false
end

if ENV['CLICOLOR_FORCE'] == '1'
  Rainbow.enabled = true
end

# On Windows systems, try to load the local ANSI support library
require 'rbconfig'
if RbConfig::CONFIG['host_os'] =~ /mswin|mingw/
  begin
    require 'Win32/Console/ANSI'
  rescue LoadError
    Rainbow.enabled = false
  end
end
