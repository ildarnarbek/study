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
        bin_search = proc { |array, query, left, right|
          middle_index = (left + right) / 2.ceil
          return -1 if array.empty? || array[right - 1] < query
          return middle_index if array[middle_index] == query

          if array[middle_index] < query
            bin_search.call(array, query, middle_index, right)
          else
            bin_search.call(array, query, left, middle_index)
          end
        }
        bin_search.call(array, query, -1, array.length)
      end
    end
  end
end
