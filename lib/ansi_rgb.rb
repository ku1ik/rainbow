module Sickill
  module Rainbow

    # Retrieve ANSI color code from RGB color.
    class AnsiRgb

      # +ground+ is one of :foreground, :background
      # +rgb+ is an array of 3 values between 0 and 255.
      def initialize(ground, rgb)
        if RGB.outside_range?(rgb)
          raise ArgumentError.new("RGB value outside 0-255 range")
        end

        @ground_code = { :foreground => 38, :background => 48 }[ground]
        @red, @green, @blue = rgb[0], rgb[1], rgb[2]
      end

      # Get the ANSI color code for this RGB color.
      def code
        index = 16 +
                RGB.to_ansi_domain(@red) * 36 +
                RGB.to_ansi_domain(@green) * 6 +
                RGB.to_ansi_domain(@blue)

        "#{@ground_code};5;#{index}"
      end

    end

    # Helper class for RGB color format.
    class RGB
      def self.outside_range?(rgb)
        rgb.min < 0 or rgb.max > 255
      end

      # Change domain of color value from 0-255 to 0-5
      def self.to_ansi_domain(value)
        (6 * (value / 256.0)).to_i
      end
    end

  end
end
