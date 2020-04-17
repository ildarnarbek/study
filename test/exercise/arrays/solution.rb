module Exercise
  module Arrays
    class << self
      def replace(array)
	@new_array=Array.new
	puts "#{array}"
	puts "#{array.max}"
	array.each {|item|
	puts item
	if item > 0
	puts "#{item}>0"  
	@new_array << array.max
	else
	@new_array << item
	end
}
puts "#{@new_array}"
return @new_array
      end

      def search(_array, _query)
        0
      end
    end
  end
end
