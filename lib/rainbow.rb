require 'rbconfig'
require File.join(File.dirname(__FILE__), 'ansi_color')

module Sickill
  module Rainbow
    class << self; attr_accessor :enabled; end
    @enabled = STDOUT.tty? && ENV['TERM'] != 'dumb' || ENV['CLICOLOR_FORCE'] == '1'

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
      return self unless Sickill::Rainbow.enabled

      var = self.dup
      matched = var.match(/^(\e\[([\d;]+)m)*/)
      var.insert(matched.end(0), "\e[#{code}m")
      var.concat("\e[0m") unless var =~ /\e\[0m$/
      var
    end

  end
end

String.send(:include, Sickill::Rainbow)

# On Windows systems, try to load the local ANSI support library
if RbConfig::CONFIG['host_os'] =~ /mswin|mingw/
  begin
    require 'Win32/Console/ANSI'
  rescue LoadError
    Sickill::Rainbow.enabled = false
  end
end
