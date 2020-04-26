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
        new_array
      end

      def search_iter(array, query, left, right)
        return -1 if array.empty? || array[right - 1] < query

        middle_index = (left + right) / 2.ceil
        return middle_index if array[middle_index] == query

        if array[middle_index] < query
          search_iter(array, query, middle_index, right)
        else
          search_iter(array, query, left, middle_index)
        end
      end

      def search(array, query)
        search_iter(array, query, -1, array.length)
      end
    end
  end
end
