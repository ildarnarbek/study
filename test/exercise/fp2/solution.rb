module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for index in 0..length - 1 do
          yield(self[index])
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        result_array = MyArray.new
        my_each { |item| result_array << yield(item) }
        result_array
      end

      # Написать свою функцию my_compact
      def my_compact
        result_array = MyArray.new
        my_each { |item| result_array << item unless item.nil? }
        result_array
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        my_each { |item| acc = acc.nil? ? item : yield(acc, item) }
        acc
      end
    end
  end
end
