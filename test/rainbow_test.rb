require 'test/unit'
require File.expand_path(File.dirname(__FILE__) + '/../lib/rainbow')

class RainbowTest < Test::Unit::TestCase #:nodoc:
  def test_color
    assert_equal "\e[31mhello\e[0m", "hello".color(:red)
  end
  
  def test_foreground
    assert_equal "hello".color(:red), "hello".foreground(:red)
  end

  def test_colour_alias
    assert_equal "hello".color(:red), "hello".colour(:red)
  end
  
  def test_background
    assert_equal "\e[42mhello\e[0m", "hello".background(:green)
  end

  def test_color_and_background
    assert_equal "\e[31m\e[42mhello\e[0m", "hello".color(:red).background(:green)
  end

  def test_bright
    assert_equal "\e[1mhello\e[0m", "hello".bright
  end

  def test_bright_and_color
    assert_equal "\e[1m\e[31mhello\e[0m", "hello".bright.color(:red)
  end

  def test_bright_and_background
    assert_equal "\e[1m\e[44mhello\e[0m", "hello".bright.background(:blue)
  end

  def test_color_override
    assert_equal "\e[31m\e[34m\e[33mhello\e[0m", "hello".color(:red).color(:blue).color(:yellow)
  end
end
