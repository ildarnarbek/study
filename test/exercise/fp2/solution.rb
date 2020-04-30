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
        #через reduce
        result_array = MyArray.new
        my_each { |item| result_array << yield(item) }
        result_array
      end

      # Написать свою функцию my_compact
      def my_compact
        #через reduce
        result_array = MyArray.new
        my_each { |item| result_array << item unless item.nil? }
        result_array
      end


      def iter( acc, index, &block ) 
        puts "\n \n enter acc #{acc} index #{index}"
        item = self[index]
        return acc if index == self.length
        if acc.nil?
          acc = item
          index = 1
        else 
          acc = acc
        end
        puts "\n def acc #{acc} index #{index}"
        puts "\n operation acc index #{acc} * #{self[index]}"
        acc = yield( acc, self[index])
        puts "res #{acc}"
        index+=1
        puts "\n end iter \n"
        return iter  acc, index, &block
      end


      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        acc = iter(acc,0,&block)
        puts "\n end reduce  acc #{acc}"
        acc 
      end
    end
  end
end
