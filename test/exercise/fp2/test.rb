require 'csv'
require './test/test_helper.rb'
require_relative './solution.rb'

# Нужно реализовать примитивы функционального программирования
class Exercise::Fp2Test < Minitest::Test
  def setup
    @array = generate :array
    @my_array = Exercise::Fp2::MyArray.new(@array)
    @int = generate :int
  end

  def test_my_each
    result = []
    my_result = []
    puts "\n my array #{@my_array}"
    func = ->(element) { result << element if element.odd? }
    my_func = ->(element) { my_result << element if element.odd? }

    assert @array.each(&func) == @my_array.my_each(&my_func)
    assert result == my_result
    # puts "my_res #{my_result}  res #{result}"
  end

  def test_my_map
    puts "int #{@int} @my_arr #{@my_array}"
    func = ->(element) { element * @int } 
    puts "1 #{@array.map(&func)}"
    puts "2 #{@array.map(&func).map(&func)}"
    assert @array.map(&func) == @my_array.my_map(&func)
    assert @array.map(&func).map(&func) == @my_array.my_map(&func).my_map(&func)

  end

  def test_my_compact
    
    func = ->(element) { element if element.even? }
    func_another = ->(element) { element * @int }
    func_yet_another = ->(element) { element.even? }
    puts "\n comp #{@array.map(&func).compact}" 
    puts "mycomp #{@my_array.my_map(&func).my_compact}"
    assert @array.map(&func).compact == @my_array.my_map(&func).my_compact
    assert @array.map(&func).compact.map(&func_another) == @my_array.my_map(&func).my_compact.my_map(&func_another)
    assert @array.map(&func_yet_another).compact == @my_array.my_map(&func_yet_another).my_compact
  end

  def test_my_reduce
      func = ->(acc, element) { acc * element }
   puts "\n reduce &func #{@array.reduce(&func)} arr #{@my_array}"
   puts "my reduce #{@my_array.my_reduce(&func)}"
   puts "\n reduce 2, &func #{@array.reduce(2, &func)} arr #{@my_array}"
   puts "my reduce #{@my_array.my_reduce(2, &func)}"
   puts "\n reduce &:+ #{@array.reduce(&:+)} arr #{@my_array}"
   puts "my reduce #{@my_array.my_reduce(&:+)}"
    assert @array.reduce(&func) == @my_array.my_reduce(&func)
    assert @array.reduce(2, &func) == @my_array.my_reduce(2, &func)
    assert @array.reduce(&:+) == @my_array.my_reduce(&:+)
  end
end
