Gem::Specification.new do |s|
   s.name = %q{rainbow}
   s.version = "1.1.1"
   s.platform = Gem::Platform::RUBY
   s.date = %q{2011-02-06}
   s.authors = ["Marcin Kulik"]
   s.email = %q{marcin.kulik@gmail.com}
   s.summary = %q{Rainbow extends ruby String class enabling coloring text on ANSI terminals}
   s.homepage = %q{http://sickill.net}
   #s.description = "Rainbow is extension to ruby's String class adding support for colorizing text on ANSI terminals. It adds methods like #color, #background, #bright etc."
   s.files = [ "README.markdown", "Changelog", "LICENSE", "lib/rainbow.rb", "lib/ansi_color.rb", "lib/ansi_rgb.rb", "test/rainbow_test.rb" ]
   s.has_rdoc = true
end

