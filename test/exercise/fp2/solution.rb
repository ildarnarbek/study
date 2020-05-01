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
        iter = ->(acc, item) { acc << yield(item) }
        my_reduce(MyArray.new, &iter)
      end

      # Написать свою функцию my_compact
      def my_compact
        iter = ->(acc, item) { item.nil? ? acc : acc << item }
        my_reduce(MyArray.new, &iter)
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, index = 0, &iter)
        return acc if index == length

        acc = acc.nil? ? self[index] : yield(acc, self[index])
        index += 1
        my_reduce(acc, index, &iter)
      end
    end
  end
end
