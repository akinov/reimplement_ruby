require 'minitest/autorun'
require_relative 'cycle'

class CycleTest < MiniTest::Test
  def test_cycle
    cycle_result = %w(a b c).cycle(2)
    
    assert_equal %w(a b c a b c), cycle_result.map {|v| v }
    # Enumeratorクラスが返る
    assert_equal Enumerator, cycle_result.class
  end

  def test_cycle_negative_args
    assert_output('') { %w(a b c).cycle(-1) { |v| p v } }
  end
end
