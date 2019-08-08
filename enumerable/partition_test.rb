require 'minitest/autorun'
require_relative 'partition'

class EachConsTest < MiniTest::Test
  # partition -> Enumerator
  def test_partition
    assert_equal Enumerator, (1..8).partition.class
  end

  # partition {|item| ... } -> [[object], [object]]
  def test_partition_block_given
    assert_equal [[2, 4, 6, 8], [1, 3, 5, 7]], (1..8).partition(&:even?)
  end
end
