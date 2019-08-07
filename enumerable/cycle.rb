class Array
  def cycle(n = nil)
    return to_enum(:cycle, n) if n&.negative?

    enumerator = Enumerator.new do |y|
      counter = 0
      while n != counter
        each { |v| y << v }
        counter += 1
      end
    end

    if block_given?
      enumerator.each { |v| yield v }
    else
      enumerator
    end
  end
end
