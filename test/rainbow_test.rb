require 'test/unit'
require 'rainbow'

class RainbowTest < Test::Unit::TestCase
  def test_foreground
    txt = "hello".foreground(:red)
    puts txt
    assert_equal "\e[31mhello\e[0m", txt
  end

  def test_background
    txt = "hello".background(:green)
    puts txt
    assert_equal "\e[42mhello\e[0m", txt
  end

  def test_foreground_and_background
    txt = "hello".foreground(:red).background(:green)
    puts txt
    assert_equal "\e[31m\e[42mhello\e[0m", txt
  end

  def test_bright
    txt = "hello".bright
    puts txt
    assert_equal "\e[1mhello\e[0m", txt
  end

  def test_bright_and_foreground
    txt = "hello".bright.foreground(:red)
    puts txt
    assert_equal "\e[1m\e[31mhello\e[0m", txt
  end

  def test_bright_and_background
    txt = "hello".bright.background(:blue)
    puts txt
    assert_equal "\e[1m\e[44mhello\e[0m", txt
  end

  def test_color_override
    txt = "hello".foreground(:red).foreground(:blue).foreground(:yellow)
    puts txt
    assert_equal "\e[31m\e[34m\e[33mhello\e[0m", txt
  end

  def test_zshow
    puts "jola"
    puts "jola bright".bright
    puts "jola blink".blink
    puts "jola italic".italic
    puts "jola underline".underline
    puts "jola inverse".inverse
    puts "jola hide".hide
  end
end
