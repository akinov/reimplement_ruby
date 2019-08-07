module Enumerable
  def chunk
    return to_enum(:chunk) unless block_given?
    
    Enumerator.new do |y|
      tmp = []
      block_result = nil
      each do |n|
        tmp_block_result = yield(n)
        if !tmp.empty? && block_result != tmp_block_result
          y << [block_result, tmp]
          tmp = []
          block_result = tmp_block_result
        end
        block_result = tmp_block_result
        tmp << n

      end
      y << [block_result, tmp]
    end
  end
end
