require 'rubygems'
require 'rake'
require 'rake/gempackagetask'

task :default => [:repackage]

spec = Gem::Specification.new do |s|
   s.name = %q{rainbow}
   s.version = "1.0.4"
   s.platform = Gem::Platform::RUBY
   s.date = %q{2009-11-08}
   s.authors = ["Marcin Kulik"]
   s.email = %q{marcin.kulik@gmail.com}
   s.summary = %q{Rainbow extends ruby String class enabling coloring text on ANSI terminals}
   s.homepage = %q{http://sickill.net}
   #s.description = "Rainbow is extension to ruby's String class adding support for colorizing text on ANSI terminals. It adds methods like #color, #background, #bright etc."
   s.files = [ "README.markdown", "Changelog", "LICENSE", "lib/rainbow.rb", "test/rainbow_test.rb" ]
   s.has_rdoc = true
   s.rubyforge_project = "rainbow"
end

Rake::GemPackageTask.new(spec) do |pkg| 
  pkg.need_tar = true 
end 

