RSpec.configure do |config|
  config.before(:each) do
    Rainbow.enabled = true
  end
end
