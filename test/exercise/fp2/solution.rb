module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each; 
        for index in 0..self.length-1 do
          yield(self[index])
        end 
        self
      end

      # Написать свою функцию my_map
      def my_map; 
        result_array = MyArray.new
        self.my_each{ |item| result_array << yield(item)}
        result_array
      end

      # Написать свою функцию my_compact
      def my_compact; 
        result_array = MyArray.new
        self.my_each{ |item| result_array << item if !item.nil?}
        result_array
      end

      # Написать свою функцию my_reduce
      def my_reduce; 
      end
    end
  end
end
