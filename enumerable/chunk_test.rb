require 'minitest/autorun'
require_relative 'chunk'

class ChunkTest < MiniTest::Test
  # chunk {|elt| ... } -> Enumerator
  def test_chunk
    chunk_result = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5].chunk(&:even?)
    expected_result = [[false, [3, 1]], [true, [4]], [false, [1, 5, 9]], [true, [2, 6]], [false, [5, 3, 5]]]

    assert_equal expected_result, chunk_result.map { |even, ary| [even, ary] }
    assert_equal Enumerator, chunk_result.class
  end

  def test_chunk_separator
    chunk_result = [2, 4, 5, 7, 4, 5, 6, 8, 9, 7, 1].chunk { |n| (n < 5) ? :_separator : n.even? }
    expected_result = [[false, [5, 7]], [false, [5]], [true, [6, 8]], [false, [9, 7]]]

    assert_equal expected_result, chunk_result.map { |even, ary| [even, ary] }
    assert_equal Enumerator, chunk_result.class
  end

  def test_chunk_alone
    chunk_result = [2, 4, 5, 7, 4, 4, 2, 2, 9, 7, 1].chunk { |n| (n == 2) ? :_alone: n.even? }
    expected_result = [[:_alone, [2]], [true, [4]], [false, [5, 7]], [true, [4, 4]], [:_alone, [2]], [:_alone, [2]], [false, [9, 7, 1]]]

    assert_equal expected_result, chunk_result.map { |even, ary| [even, ary] }
    assert_equal Enumerator, chunk_result.class
  end
end
