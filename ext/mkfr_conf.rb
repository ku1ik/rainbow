require 'rubygems'
require 'rubygems/command'
require 'rubygems/dependency_installer'

begin
  Gem::Command.build_args = ARGV
rescue NoMethodError
  exit 1
end

installer = Gem::DependencyInstaller.new

begin
  if RUBY_PLATFORM =~ /win32/i || RUBY_PLATFORM =~ /mingw32/i
    installer.install('windows-pr')
    installer.install('win32console')
  end

rescue
  exit 1
end