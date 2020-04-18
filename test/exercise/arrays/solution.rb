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
	middle_index =(_array.length/2).ceil
	middle_item = _array[middle_index]
	last_index = _array.length-1
	last_item = _array[last_index]
	puts "#{_array} q = #{_query} length #{_array.length}"
	puts "middle_index= #{middle_index} midle_item = #{middle_item} last_item = #{last_item}"
	#  puts "return -1"
	  return -1 if _array.length == 0 or last_item < _query
	#  puts "return #{middle_index}"
	 
	  if middle_item > _query
	    puts "> #{_array.slice(0,middle_index)}"
	    new_middle_index = search(_array[0..middle_index],_query)
	    puts " new_middle #{new_middle} middle #{middle_item}"
	    return middle_index - new_middle_index
	  elsif middle_item == _query
	    return middle_index
	  else 	
	   puts "< #{_array.slice(middle_index,last_index)}" 
           new_middle_index = search(_array[middle_index..last_index],_query)
 

	end
      end
    end
  end
end
