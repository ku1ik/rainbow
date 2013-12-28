module Rainbow

  class NullPresenter < ::String

    def foreground(*values); self; end
    def background(*values); self; end
    def reset; self; end
    def bright; self; end
    def italic; self; end
    def underline; self; end
    def blink; self; end
    def inverse; self; end
    def hide; self; end

    alias_method :color, :foreground
    alias_method :colour, :foreground

  end

end
