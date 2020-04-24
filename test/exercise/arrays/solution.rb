module Exercise
  module Arrays
    class << self
      def replace(array)
        new_array = []
        max_item = array[0]
        array.each do |item|
          max_item = item if item > max_item
        end
        array.each do |item|
          new_array << (item.positive? ? max_item : item)
        end
      end

      def search(array, query)
        bin_search = Proc.new {|array, query, left, right|
          middle_index = (left+right)/2.ceil
          puts "\n array = #{array[0..10]} query = #{query} \n left = #{left} right = #{right} \n middle #{middle_index} array[#{middle_index}] = #{array[middle_index]} "
          if  array.length < 1 || array[right-1] < query
            puts "ret -1"
            return -1
          end
          if array[middle_index] == query
            puts "ret #{middle_index}"
            return middle_index
            end

          if array[middle_index] < query
            puts "#{array[middle_index]} < #{query}"
            bin_search.call(array,query,middle_index,right)   
          else
            puts "#{array[middle_index]} > #{query}"
            bin_search.call(array,query,left,middle_index)
          end
          }
          bin_search.call(array,query,-1,array.length)
      end
    end
  end
end
