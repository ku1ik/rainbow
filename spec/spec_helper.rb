if ENV["CI"] && (!defined?(RUBY_ENGINE) || RUBY_ENGINE == "ruby")
  require 'coveralls'
  Coveralls.wear!
end
