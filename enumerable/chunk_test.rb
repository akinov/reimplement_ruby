require 'minitest/autorun'
require_relative 'chunk'

class ChunkTest < MiniTest::Test
  def test_chunk
    array = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
    result = [[false, [3, 1]], [true, [4]], [false, [1, 5, 9]], [true, [2, 6]], [false, [5, 3, 5]]]
    chunk_result = array.chunk { |n| n.even? }
    assert_equal result, chunk_result.map {|even, ary| [even, ary] }
    assert_equal Enumerator, chunk_result.class
  end
end
