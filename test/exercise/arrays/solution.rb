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

      def search(array, query)
        @left = -1
        @right = array.length
        while @left < @right - 1
          @middle_index = (@left + @right) / 2.ceil
          if array[@middle_index] < query
            @left = @middle_index
          else
            @right = @middle_index
          end
        end
        array[@right] == query ? @right : -1
      end
    end
  end
end
