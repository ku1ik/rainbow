module Sickill
  module Rainbow
  
    # I retrieve ANSI color code from a color name, an html color code
    # or an RGB color
    class ANSIColorCode
    
      # +ground+ is one of :foreground, :background
      def initialize color, ground
        @color, @ground = color, ground
      end
      
      def code
        case @color
          when Symbol
            validate_color_name
            TERM_COLORS[@color] + (@ground == :foreground ? 30 : 40)
          when String
            @color = @color.gsub("#", "")
            red, green, blue = @color[0..1].to_i(16), @color[2..3].to_i(16), @color[4..5].to_i(16)
            get_rgb_code(red, green, blue)
          when Array
            unless @color.size == 3
              raise ArgumentError.new("Bad number of arguments for RGB color definition, should be 3") 
            end
            get_rgb_code(@color[0], @color[1], @color[2])
        end
      end
      
      private
      
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
