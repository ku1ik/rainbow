require File.join(File.dirname(__FILE__), 'ansi_rgb')

module Sickill
  module Rainbow

    # Retrieve ANSI color code from a color name, an html color
    # or an RGB color
    class AnsiColor

      # +ground+ is one of :foreground, :background
      # +color+ is one of this 3 formats: name, html, rgb
      def initialize(ground, *color)
        @ground = ground

        if color.size == 1
          @color = color.first
        else
          @color = color
        end
      end

      # Get the ANSI color code.
      def code
        case @color
          when Symbol then code_from_name
          when String then code_from_html
          when Array then code_from_rgb
        end
      end

      private

      def code_from_name #:nodoc:
        validate_color_name

        TERM_COLORS[@color] + (@ground == :foreground ? 30 : 40)
      end

      def code_from_html #:nodoc:
        @color = @color.gsub("#", "")
        AnsiRgb.new(@ground, rgb_from_html).code
      end

      def rgb_from_html #:nodoc:
        red = @color[0..1].to_i(16)
        green = @color[2..3].to_i(16)
        blue = @color[4..5].to_i(16)
        [red, green, blue]
      end

      def code_from_rgb #:nodoc:
        unless @color.size == 3
          raise ArgumentError.new \
            "Bad number of arguments for RGB color definition, should be 3"
        end

        AnsiRgb.new(@ground, @color).code
      end

      def validate_color_name #:nodoc:
        color_names = TERM_COLORS.keys

        unless color_names.include?(@color)
          raise ArgumentError.new \
            "Unknown color name, valid names: #{color_names.join(', ')}"
        end
      end

    end
  end
end
