require 'rainbow/core'
require 'rainbow/wrapper'
require 'rainbow/string'
require 'rainbow/legacy'

Rainbow.enabled = false unless STDOUT.tty? && STDERR.tty?
Rainbow.enabled = false if ENV['TERM'] == 'dumb'
Rainbow.enabled = true if ENV['CLICOLOR_FORCE'] == '1'

# On Windows systems, try to load the local ANSI support library
require 'rbconfig'
if RbConfig::CONFIG['host_os'] =~ /mswin|mingw/
  begin
    require 'Win32/Console/ANSI'
  rescue LoadError
    Rainbow.enabled = false
  end
end
