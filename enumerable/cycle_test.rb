require 'minitest/autorun'
require_relative 'cycle'

class CycleTest < MiniTest::Test
  # cycle(n=nil) -> Enumerator
  def test_cycle
    assert_equal Enumerator, %w[a b c].cycle(2).class
    assert_equal %w[a b c a b c], %w[a b c].cycle(2).map { |v| v }
  end

  # cycle(n=nil) {|obj| ... } -> object | nil
  def test_cycle_block_given
    assert_output("a\nb\nc\na\nb\nc\n") { %w[a b c].cycle(2) { |v| puts v } }
  end

  def test_cycle_negative_args
    assert_nil %w[a b c].cycle(-1) { |v| p v }
    assert_output('') { %w[a b c].cycle(-1) { |v| puts v } }
  end
end
