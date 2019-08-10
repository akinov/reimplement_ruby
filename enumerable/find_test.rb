require 'minitest/autorun'
require_relative 'find'

class AllTest < MiniTest::Test
  # find(ifnone = nil) -> Enumerator
  # detect(ifnone = nil) -> Enumerator
  def test_find
    assert_equal Enumerator, [].find
  end

  # find(ifnone = nil) {|item| ... } -> object
  # detect(ifnone = nil) {|item| ... } -> object
  def test_block_given
    assert_equal 3, [1, 2, 3, 4, 5].find { |i| (i % 3).zero? }
    # assert_equal nil, [2, 2, 2, 2, 2].find { |i| (i % 3).zero? }

    # ifnone = proc { raise ArgumentError }
    # assert_raises ArgumentError do
    #   [1, 2, 3, 4, 5].find(ifnone) { |i| (i % 7).zero? }
    # end
  end
end
