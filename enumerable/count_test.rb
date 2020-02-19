require 'minitest/autorun'
require_relative 'count'

class AllTest < MiniTest::Test
  # count -> Integer
  def test_count
    assert_equal 4, [1, 2, 4, 2].count
  end

  # count(item) -> Integer
  def test_with_args
    assert_equal 2, [1, 2, 4, 2].count(2)
  end

  # count {|obj| ... } -> Integer
  def test_block_given
    assert_equal 3, [1, 2, 4, 2].count(&:even?)
  end

  def test_with_nil_args
    assert_equal 1, [1, 2, 4, 2, nil].count(nil)
  end
end
