module Rainbow

  class << self; attr_accessor :enabled; end
  @enabled = true

  TERM_COLORS = {
    :black   => 0,
    :red     => 1,
    :green   => 2,
    :yellow  => 3,
    :blue    => 4,
    :magenta => 5,
    :cyan    => 6,
    :white   => 7,
    :default => 9,
  }

  TERM_EFFECTS = {
    :reset     => 0,
    :bright    => 1,
    :italic    => 3,
    :underline => 4,
    :blink     => 5,
    :inverse   => 7,
    :hide      => 8,
  }

end
