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
end
