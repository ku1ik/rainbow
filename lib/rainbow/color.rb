require 'rainbow/ansi_color'

module Rainbow
  class Color
    def self.build(ground, color)
      new(AnsiColor.new(ground, *color))
    end

    def initialize(ansi_color)
      @ansi_color = ansi_color
    end

    def codes
      @ansi_color.code
    end
  end
end
