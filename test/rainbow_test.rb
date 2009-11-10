require 'test/unit'
require File.expand_path(File.dirname(__FILE__) + '/../lib/rainbow')

class RainbowTest < Test::Unit::TestCase #:nodoc:
  def test_color_by_name
    assert_equal "\e[31mhello\e[0m", "hello".color(:red)
  end
  
  def test_color_by_rgb
    assert_equal "\e[38;5;196mhello\e[0m", "hello".color(255, 0, 0)
  end
  
  def test_foreground_alias
    assert_equal "hello".color(:red), "hello".foreground(:red)
  end

  def test_colour_alias
    assert_equal "hello".color(:red), "hello".colour(:red)
  end
  
  def test_background_by_name
    assert_equal "\e[42mhello\e[0m", "hello".background(:green)
  end

  def test_background_by_rgb
    assert_equal "\e[48;5;46mhello\e[0m", "hello".background(0, 255, 0)
  end

  def test_color_and_background
    assert_equal "\e[31m\e[42mhello\e[0m", "hello".color(:red).background(:green)
  end
  
  def test_hex_color
    assert_equal "\e[48;5;46mhello\e[0m", "hello".background("#00FF00")
    assert_equal "\e[48;5;46mhello\e[0m", "hello".background("00FF00")
    assert_equal "\e[48;5;46mhello\e[0m", "hello".background("00ff00")
  end

  def test_bad_color_name
    assert_raises ArgumentError do
      "hello".background(:baaaad)
    end
  end

  def test_rgb_color_with_2_args
    assert_raises ArgumentError do
      "hello".background(1, 2)
    end
  end

  def test_rgb_color_with_4_args
    assert_raises ArgumentError do
      "hello".background(1, 2, 3, 4)
    end
  end

  def test_rgb_color_with_values_below_zero
    assert_raises ArgumentError do
      "hello".background(-3, 2, 3)
    end
  end

  def test_rgb_color_with_values_above_255
    assert_raises ArgumentError do
      "hello".background(256, 2, 3)
    end
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
