if ENV['COVERALLS_REPO_TOKEN']
  require 'coveralls'
  Coveralls.wear!
end

Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |file| require file }

RSpec.configure do |config|
  config.disable_monkey_patching!
end
