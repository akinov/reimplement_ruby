require 'minitest/autorun'
require_relative 'drop'

class CycleTest < MiniTest::Test
  # drop(n) -> Array
  def test_drop
    assert_equal [4, 5, 0], [1, 2, 3, 4, 5, 0].drop(3)
  end
end
