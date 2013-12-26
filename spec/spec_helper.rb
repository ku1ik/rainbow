if ENV["CI"] && (!defined?(RUBY_ENGINE) || RUBY_ENGINE == "ruby")
  require 'coveralls'
  Coveralls.wear!
end

RSpec.configure do |config|
  config.before(:each) do
    Rainbow.enabled = true
  end
end
