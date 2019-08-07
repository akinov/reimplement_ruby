require 'minitest/autorun'
require_relative 'each_cons'

class EachConsTest < MiniTest::Test
  def test_each_cons
    each_cons_result = (1..5).each_cons(3)
    
    assert_equal [[1, 2, 3], [2, 3, 4], [3, 4, 5]], each_cons_result.map { |v| v }
    # Enumeratorクラスが返る
    assert_equal Enumerator, each_cons_result.class
  end

  def test_each_cons_block
    assert_output("[1, 2, 3]\n[2, 3, 4]\n[3, 4, 5]\n") { (1..5).each_cons(3) { |v| p v } }
  end
end
