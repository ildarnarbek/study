module Exercise
  module Arrays
    class << self
      def replace(array)
	@new_array=Array.new
	array.each {|item|
	if item > 0  
	@new_array << array.max
	else
	@new_array << item
	end
	}
	return @new_array
      end

      def search(_array, _query)
	@left = -1
	@right = _array.length
	last_index = _array.length-1
	last_item = _array[last_index]
	puts " \n #{_array[0..10]} q= #{_query} l= #{@left} r =#{@right} last #{_array[-1]}"
	return -1 if _array.length == 0 or last_item < _query
	while @left < @right - 1
	puts "start l = #{@left} r = #{@right}"  
	@middle_index = (@left+@right)/2.ceil	
	if _array[@middle_index] < _query    
	@left = @middle_index
	puts "middle_index #{@middle_index} .. middle_item #{_array[@middle_index]} < #{_query} l = #{@left}"
	else	 
	@right = @middle_index
	puts "middle_index #{@middle_index} .. middle_item #{_array[@middle_index]} > #{_query} r= #{@right}"
	end
	puts "end l = #{@left} r= #{@right}"
	end
	return _array[@right] == _query ? @right : -1
	
	end
    end
  end
end
