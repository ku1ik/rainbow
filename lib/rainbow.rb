require 'rbconfig'

module Sickill
  module Rainbow
    class << self; attr_accessor :enabled; end
    @enabled = STDOUT.tty? && ENV['TERM'] != 'dumb'

    TERM_COLORS = {
      :black => 0,
      :red => 1,
      :green => 2,
      :yellow => 3,
      :blue => 4,
      :magenta => 5,
      :cyan => 6,
      :white => 7,
      :default => 9,
    }

    TERM_EFFECTS = {
      :reset => 0,
      :bright => 1,
      :italic => 3,
      :underline => 4,
      :blink => 5,
      :inverse => 7,
      :hide => 8,
    }

    # Sets foreground color of this text.
    def foreground(*color)
      color = color.first if color.size == 1
      wrap_with_code(get_color_code(color, :foreground))
    end
    alias_method :color, :foreground
    alias_method :colour, :foreground


    # Sets background color of this text.
    def background(*color)
      color = color.first if color.size == 1
      wrap_with_code(get_color_code(color, :background))
    end

    # Resets terminal to default colors/backgrounds.
    #
    # It shouldn't be needed to use this method because all methods append terminal reset code to end of string.
    def reset
      wrap_with_code(TERM_EFFECTS[:reset])
    end

    # Turns on bright/bold for this text.
    def bright
      wrap_with_code(TERM_EFFECTS[:bright])
    end

    # Turns on italic style for this text (not well supported by terminal emulators).
    def italic
      wrap_with_code(TERM_EFFECTS[:italic])
    end

    # Turns on underline decoration for this text.
    def underline
      wrap_with_code(TERM_EFFECTS[:underline])
    end

    # Turns on blinking attribute for this text (not well supported by terminal emulators).
    def blink
      wrap_with_code(TERM_EFFECTS[:blink])
    end

    # Inverses current foreground/background colors.
    def inverse
      wrap_with_code(TERM_EFFECTS[:inverse])
    end

    # Hides this text (set its color to the same as background).
    def hide
      wrap_with_code(TERM_EFFECTS[:hide])
    end

    protected
    def wrap_with_code(code) #:nodoc:
      return self unless Sickill::Rainbow.enabled

      out = "#{self}"
      match = out.match(/^(\e\[([\d;]+)m)*/)
      out.insert(match.end(0), "\e[#{code}m")
      out.concat("\e[0m") unless out =~ /\e\[0m$/
      out
    end

    def get_color_code(color, type) #:nodoc:
      case color
      when Symbol
        validate_color(color)
        TERM_COLORS[color] + (type == :foreground ? 30 : 40)
      when String
        color = color.gsub("#", "")
        r, g, b = color[0..1].to_i(16), color[2..3].to_i(16), color[4..5].to_i(16)
        get_rgb_code(r, g, b, type)
      when Array
        raise ArgumentError.new("Bad number of arguments for RGB color definition, should be 3") unless color.size == 3
        get_rgb_code(color[0], color[1], color[2], type)
      end
    end

    def get_rgb_code(r, g, b, type) #:nodoc:
      raise ArgumentError.new("RGB value outside 0-255 range") if [r, g, b].min < 0 || [r, g, b].max > 255
      code = { :foreground => 38, :background => 48 }[type]
      index = 16 + (6 * (r / 256.0)).to_i * 36 + (6 * (g / 256.0)).to_i * 6 + (6 * (b / 256.0)).to_i
      "#{code};5;#{index}"
    end

    def validate_color(color) #:nodoc:
      raise ArgumentError.new("Unknown color, valid colors: #{TERM_COLORS.keys.join(', ')}") unless TERM_COLORS.keys.include?(color)
    end
  end
end

String.send(:include, Sickill::Rainbow)

# On Windows systems, try to load the local ANSI support library
if Config::CONFIG['host_os'] =~ /mswin|mingw/
  begin
    require 'Win32/Console/ANSI'
  rescue LoadError
    Sickill::Rainbow.enabled = false
  end
end
