dir = File.expand_path(File.dirname(__FILE__))
require File.join(dir, 'lib', 'rainbow', 'version')

Gem::Specification.new do |s|
  s.name = 'rainbow'
  s.version = Rainbow::VERSION
  s.authors = ['Marcin Kulik']
  s.email = %q{marcin.kulik@gmail.com}
  s.homepage = %q{http://ku1ik.com/}
  s.summary = %q{Colorize printed text on ANSI terminals}
  s.description = %q{Colorize printed text on ANSI terminals}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test}/*`.split("\n")
  s.require_paths = ['lib']
end
