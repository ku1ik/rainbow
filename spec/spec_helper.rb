# frozen_string_literal: true

if ENV["COVERALLS_REPO_TOKEN"]
  require "coveralls"
  Coveralls.wear!
end

Dir[File.expand_path("support/**/*.rb", __dir__)].sort.each { |file| require file }

RSpec.configure(&:disable_monkey_patching!)
