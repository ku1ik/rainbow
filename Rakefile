require 'rubygems'
require 'rake'
require 'rake/gempackagetask'

task :default => [:repackage]

spec = Gem::Specification.new do |s|
   s.name = %q{rainbow}
   s.version = "1.0"
   s.platform = Gem::Platform::RUBY
   s.date = %q{2008-07-21}
   s.authors = ["Marcin Kulik"]
   #s.email = %q{sikkill@gmail.com}
   s.summary = %q{Rainbow extends ruby String class enabling coloring text on ANSI terminals}
   #s.homepage = %q{http://sickill./}
   #s.description = "Rainbow is extension to ruby's String class adding support for colorizing text on ANSI terminals. It adds methods like #color, #background, #bright etc."
   s.files = [ "README", "Changelog", "LICENSE", "lib/rainbow.rb", "test/rainbow_test.rb" ]
   s.has_rdoc = true
   s.rubyforge_project = "rainbow"
end

Rake::GemPackageTask.new(spec) do |pkg| 
  pkg.need_tar = true 
end 

