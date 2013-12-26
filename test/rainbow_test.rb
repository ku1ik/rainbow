  def test_reset
    assert_equal "\e[0mhello\e[0m", "hello".reset
  end
