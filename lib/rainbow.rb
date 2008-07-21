
module Sickill
  module Rainbow
    FOREGROUNDS = { 
      :black => 30,
      :red => 31,
      :green => 32,
      :yellow => 33,
      :blue => 34,
      :magenta => 35,
      :cyan => 36,
      :white => 37,
      :default => 39,
    }
    BACKGROUNDS = {
      :black => 40,
      :red => 41,
      :green => 42,
      :yellow => 43,
      :blue => 44,
      :magenta => 45,
      :cyan => 46,
      :white => 47,
      :default => 49,
    }
    EFFECTS = {
      :reset => 0,
      :bright => 1,
      :italic => 3,
      :underline => 4,
      :blink => 5,
      :inverse => 7,
      :hide => 8,
    }
    
  	def foreground(color)
      color = color.to_sym
      raise ArgumentError.new("Unknown color, valid colors: #{FOREGROUNDS.keys.join(', ')}") unless FOREGROUNDS.keys.include?(color)
      wrap(FOREGROUNDS[color])
  	end

    def background(color)
      color = color.to_sym
      raise ArgumentError.new("Unknown color, valid colors: #{BACKGROUNDS.keys.join(', ')}") unless BACKGROUNDS.keys.include?(color)
      wrap(BACKGROUNDS[color])
    end
    
    def reset
      wrap(EFFECTS[:reset])
    end
    
    def bright
      wrap(EFFECTS[:bright])
    end

    def italic
      wrap(EFFECTS[:italic])
    end
    
    def underline
      wrap(EFFECTS[:underline])
    end

    def blink
      wrap(EFFECTS[:blink])
    end

    def inverse
      wrap(EFFECTS[:inverse])
    end

    def hide
      wrap(EFFECTS[:hide])
    end

    protected
    def wrap(code)
      out = self
      match = out.match(/^(\e\[([\d;]+)m)*/)
      out.insert(match.end(0), "\e[#{code}m")
      out.concat("\e[0m") unless out =~ /\e\[0m$/
      out
    end
  end
end

String.send(:include, Sickill::Rainbow)

#puts "abc".foreground(:red).foreground(:blue)

# puts "jola".foreground(:green).background(:yellow)
#puts "misio".foreground(:red).background(:blue).bright
# puts "grubo".bright
# puts "mruga".blink
# puts "cyan mruga".blink.foreground(:cyan)
# puts "green podkresl".foreground(:green).underline
# puts "podkresl green".underline.foreground(:green)
#puts "podkresl".underline
# puts "red blue".foreground(:red).foreground(:blue)
# puts "\e[4;32;44mabc\e[0m"
# puts "\e[;32;44mabc\e[0m"
# puts "\e[4;44mabc\e[0m"
# puts "\e[4;32mabc\e[0m"
# puts "\e[32;4mabc\e[0m"
