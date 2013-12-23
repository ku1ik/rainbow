require 'rubygems'
require 'rake'
require 'rubygems/package_task'

task :default => [:repackage]

spec = eval(File.read('rainbow.gemspec'))
Gem::PackageTask.new(spec) do |pkg| 
  pkg.need_tar = true 
end 

desc "Test rainbow"
task :test do
  exec "ruby -Ilib test/rainbow_test.rb"
end
