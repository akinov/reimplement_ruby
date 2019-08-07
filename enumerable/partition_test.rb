require 'minitest/autorun'
require_relative 'partition'

class EachConsTest < MiniTest::Test
  def test_partition
    assert_equal [[2, 4, 6, 8], [1, 3, 5, 7]], (1..8).partition { |v| v % 2 == 0 }
    # Enumeratorクラスが返る
    assert_equal Enumerator, (1..8).partition.class
  end
end
