require 'minitest/autorun'
require_relative 'each_slice'

class EachConsTest < MiniTest::Test
  # each_slice(n) -> Enumerator
  def test_each_slice
    assert_equal Enumerator, (1..5).each_slice(3).class
  end

  # each_slice(n) {|list| ... } -> nil
  def test_block_given
    assert_nil((1..5).each_slice(3) { |v| v })
    assert_output("[1, 2, 3]\n[4, 5, 6]\n[7, 8, 9]\n[10]\n") { (1..10).each_slice(3) { |a| p a } }
  end
end
