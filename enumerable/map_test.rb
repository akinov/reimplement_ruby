require 'minitest/autorun'
require_relative 'map'

class AllTest < MiniTest::Test
  # collect -> Enumerator
  # map -> Enumerator
  def test_map
    assert_equal Enumerator, [].map.class
  end

  # collect {|item| ... } -> [object]
  # map {|item| ... } -> [object]
  def test_block_given
    assert_equal [3, 6, 9], [1, 2, 3].map { |n| n * 3 }
    assert_equal [true, false, true], [5, -1, 7].map(&:positive?)
  end
end
