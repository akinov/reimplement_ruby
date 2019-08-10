require 'minitest/autorun'
require_relative 'any'

class AnyTest < MiniTest::Test
  # any? -> bool
  def test_any
    assert_equal true, [nil, true, 99].any?
    assert_equal false, [].any?
  end

  # any? {|item| ... } -> bool
  def test_block_given
    assert_equal false, [1, 2, 3].any? { |v| v > 3 }
    assert_equal true, [1, 2, 3].any? { |v| v > 1 }
    assert_equal false, [].any?(&:positive?)
  end

  # any?(pattern) -> bool
  def test_pattern
    assert_equal false, %w[ant bear cat].any?(/d/)
    assert_equal true, %w[ant bear cat].any?(/b/)
    assert_equal true, [nil, true, 99].any?(Integer)
  end
end
