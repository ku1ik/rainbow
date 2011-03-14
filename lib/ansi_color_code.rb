module Sickill
  module Rainbow
  
    # I retrieve ANSI color code from a color name, an html color code
    # or an RGB color
    class ANSIColorCode
    
      # +ground+ is one of :foreground, :background
      def initialize ground, *color
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
      
      def code_from_name
        validate_color_name
        TERM_COLORS[@color] + (@ground == :foreground ? 30 : 40)
      end
      
      def code_from_html
        @color = @color.gsub("#", "")
        red, green, blue = rgb_from_html
        get_rgb_code(red, green, blue)
      end
      
      def rgb_from_html
        red = @color[0..1].to_i(16)
        green = @color[2..3].to_i(16)
        blue = @color[4..5].to_i(16)
        [red, green, blue]
      end
      
      def code_from_rgb
        unless @color.size == 3
          raise ArgumentError.new("Bad number of arguments for RGB color definition, should be 3") 
        end
        get_rgb_code(@color[0], @color[1], @color[2])
      end
      
      def validate_color_name
        color_names = TERM_COLORS.keys
        unless color_names.include?(@color)
          raise ArgumentError.new("Unknown color, valid colors: #{color_names.join(', ')}")
        end
      end
      
      def get_rgb_code(red, green, blue)
        if [red, green, blue].min < 0 || [red, green, blue].max > 255
          raise ArgumentError.new("RGB value outside 0-255 range") 
        end
        code = { :foreground => 38, :background => 48 }[@ground]
        index = 16 + (6 * (red / 256.0)).to_i * 36 + (6 * (green / 256.0)).to_i * 6 + (6 * (blue / 256.0)).to_i
        "#{code};5;#{index}"
      end
      
    end
  end
end
