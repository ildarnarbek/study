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
        # через reduce
        result_array = MyArray.new
        my_each { |item| result_array << yield(item) }
        result_array
      end

      # Написать свою функцию my_compact
      def my_compact
        # через reduce
        result_array = MyArray.new
        my_each { |item| result_array << item unless item.nil? }
        result_array
      end

      def iter(acc, index, &block)
        return acc if index == length

        acc = acc.nil? ? self[index] : yield(acc, self[index])
        iter(acc, index += 1, &block)
      end

      # Написать свою функцию my_reduce
      # def my_reduce(acc = nil, &block, index = 0)
      def my_reduce(acc = nil, index = 0, &block )
        # acc = iter(acc, 0, &block)
        return acc if index == length
        acc = acc.nil? ? self[index] : yield(acc, self[index])
        my_reduce(acc, index +=1, &block)
        # acc
      end
    end
  end
end
