module Rainbow

  class << self; attr_accessor :enabled; end
  @enabled = true

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
