require 'rainbow/ansi_color'
require 'rainbow/consts'
require 'rainbow/string_utils'

module Rainbow

  class Wrapper < ::String

    # Sets foreground color of this text.
    def foreground(*color)
      wrap_with_code(AnsiColor.new(:foreground, *color).code)
    end

    alias_method :color, :foreground
    alias_method :colour, :foreground

    # Sets background color of this text.
    def background(*color)
      wrap_with_code(AnsiColor.new(:background, *color).code)
    end

    # Resets terminal to default colors/backgrounds.
    #
    # It shouldn't be needed to use this method because all methods
    # append terminal reset code to end of string.
    def reset
      wrap_with_code(TERM_EFFECTS[:reset])
    end

    # Turns on bright/bold for this text.
    def bright
      wrap_with_code(TERM_EFFECTS[:bright])
    end

    # Turns on italic style for this text (not well supported by terminal
    # emulators).
    def italic
      wrap_with_code(TERM_EFFECTS[:italic])
    end

    # Turns on underline decoration for this text.
    def underline
      wrap_with_code(TERM_EFFECTS[:underline])
    end

    # Turns on blinking attribute for this text (not well supported by terminal
    # emulators).
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

    private

    def wrap_with_code(code) #:nodoc:
      return self unless Rainbow.enabled

      StringUtils.wrap_with_sgr(self, [code])
    end

  end

end
