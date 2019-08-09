class Array
  def all?(*args)
    case args.length
    when 0
      lamda = if block_given?
                ->(v) { yield v }
              else
                ->(v) { v }
              end
    when 1
      pettern = args.shift
      lamda = if pettern.is_a? Class
                ->(v) { v.is_a? pettern }
              elsif pettern.is_a? Regexp
                ->(v) { v =~ pettern }
              else
                ->(v) { v === pettern }
              end
    else
      raise ArgumentError, "wrong number of arguments (given #{args.length}, expected 0..1)"
    end

    each do |n|
      return false unless lamda.call(n)
    end

    true
  end
end
