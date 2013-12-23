module Sickill
  module Rainbow
    def self.enabled=(value)
      # deprecation message
      ::Rainbow.enabled = value
    end

    def self.enabled
      ::Rainbow.enabled
    end
  end
end
