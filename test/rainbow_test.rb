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

  def test_reset
    assert_equal "\e[0mhello\e[0m", "hello".reset
  end

  def test_italic
    assert_equal "\e[3mhello\e[0m", "hello".italic
  end

  def test_underline
    assert_equal "\e[4mhello\e[0m", "hello".underline
  end

  def test_blink
    assert_equal "\e[5mhello\e[0m", "hello".blink
  end

  def test_inverse
    assert_equal "\e[7mhello\e[0m", "hello".inverse
  end

  def test_hide
    assert_equal "\e[8mhello\e[0m", "hello".hide
  end

  def test_immutability
    string = "hello"
    string.color(:red)
    assert_equal string, "hello"
  end

  def test_frozen
    string = "frozen"
    string.freeze
    string.color(:red)
  end

  class MyString < String
  end

  def test_inheritance
    my_string = MyString.new "hello"
    assert_equal "\e[31mhello\e[0m", my_string.color(:red)
  end

  def test_disabled
    Sickill::Rainbow.enabled = false
    assert_equal "hello", "hello".color(:red)
    Sickill::Rainbow.enabled = true
  end

end

class AnsiColorTest < Test::Unit::TestCase
  include Sickill::Rainbow

  ### Foreground

  def test_bad_foreground_name
    assert_raises ArgumentError do
      AnsiColor.new(:foreground, :azerty).code
    end
  end

  def test_by_name_black_foreground
    assert_equal 30, AnsiColor.new(:foreground, :black).code
  end

  def test_by_name_red_foreground
    assert_equal 31, AnsiColor.new(:foreground, :red).code
  end

  def test_by_name_green_foreground
    assert_equal 32, AnsiColor.new(:foreground, :green).code
  end

  def test_by_name_yellow_foreground
    assert_equal 33, AnsiColor.new(:foreground, :yellow).code
  end

  def test_by_name_blue_foreground
    assert_equal 34, AnsiColor.new(:foreground, :blue).code
  end

  def test_by_name_magenta_foreground
    assert_equal 35, AnsiColor.new(:foreground, :magenta).code
  end

  def test_by_name_cyan_foreground
    assert_equal 36, AnsiColor.new(:foreground, :cyan).code
  end

  def test_by_name_white_foreground
    assert_equal 37, AnsiColor.new(:foreground, :white).code
  end

  ### Background

  def test_bad_background_name
    assert_raises ArgumentError do
      AnsiColor.new(:background, :azerty).code
    end
  end

  def test_by_name_black_background
    assert_equal 40, AnsiColor.new(:background, :black).code
  end

  def test_by_name_red_background
    assert_equal 41, AnsiColor.new(:background, :red).code
  end

  def test_by_name_green_background
    assert_equal 42, AnsiColor.new(:background, :green).code
  end

  def test_by_name_yellow_background
    assert_equal 43, AnsiColor.new(:background, :yellow).code
  end

  def test_by_name_blue_background
    assert_equal 44, AnsiColor.new(:background, :blue).code
  end

  def test_by_name_magenta_background
    assert_equal 45, AnsiColor.new(:background, :magenta).code
  end

  def test_by_name_cyan_background
    assert_equal 46, AnsiColor.new(:background, :cyan).code
  end

  def test_by_name_white_background
    assert_equal 47, AnsiColor.new(:background, :white).code
  end

  ### Hex color

  def test_by_hex_maj
    assert_equal "38;5;46", AnsiColor.new(:foreground, "00FF00").code
  end

  def test_by_hex_min
    assert_equal "38;5;46", AnsiColor.new(:foreground, "00ff00").code
  end

  def test_by_hex_maj_with_sharp
    assert_equal "38;5;46", AnsiColor.new(:foreground, "#00FF00").code
  end

  def test_by_hex_min_with_sharp
    assert_equal "38;5;46", AnsiColor.new(:foreground, "#00ff00").code
  end

  ### RGB color

  def test_too_few_colors
    assert_raises ArgumentError do
      AnsiColor.new(:foreground, 255, 0).code
    end
  end

  def test_too_much_colors
    assert_raises ArgumentError do
      AnsiColor.new(:foreground, 255, 0, 0, 0).code
    end
  end

  def test_by_rgb_red_foreground
    assert_equal "38;5;196", AnsiColor.new(:foreground, 255, 0, 0).code
  end

end

class AnsiRgbTest < Test::Unit::TestCase
  include Sickill::Rainbow

  def test_red
    assert_equal "38;5;196", AnsiRgb.new(:foreground, [255, 0, 0]).code
  end

  def test_rgb_color_with_values_below_zero
    assert_raises ArgumentError do
      AnsiRgb.new(:foreground, [-1, 0, 0])
    end
  end

  def test_rgb_color_with_values_above_255
    assert_raises ArgumentError do
      AnsiRgb.new(:foreground, [256, 0, 0])
    end
  end

end
