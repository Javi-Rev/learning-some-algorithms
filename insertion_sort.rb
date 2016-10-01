require 'minitest'
require 'benchmark'

class SortArray
  attr_accessor :sort_array

  def initialize(sort_array)
    @sort_array = sort_array
  end

  def insertion_sort
    sort_array.each_with_index do |element, index|
      previous_element_index = index - 1
      while previous_element_index >= 0 and sort_array[previous_element_index] > element
        sort_array[previous_element_index + 1] = sort_array[previous_element_index]
        previous_element_index -= 1
      end
      sort_array[previous_element_index + 1] = element
    end
  end
end

# Simple tests to verify sort is sucessful

class SortArrayTest < MiniTest::Test
  def test_output_matches_standard_sort_method
    array = [2, 4, 51, 4, 4, 6, 5, 34, 3, 1, 353, 34, 335]
    sort_array = SortArray.new(array)

    assert_equal array.sort, sort_array.insertion_sort
  end
end

if MiniTest.run
  puts "Tests passing...let's start sorting!"

  array = [49, 34, 56,34,2,5,3334,3534, 980, 829, 9]
  sort_array = SortArray.new(array)
  cycles = 20_000_000

  puts "Original unsorted array: #{array.join(', ')}"
  puts "Ruby sort method sorted array: #{array.sort.join(', ')}"
  puts "Insertion sorted array: #{sort_array.insertion_sort.join(', ')}"
  puts "============================================================================"
  puts "Some benchmarks comparing algorithm performance:"
  puts "Ruby sort #{Benchmark.measure {array.sort*cycles}}"
  puts "Insertion #{Benchmark.measure {sort_array.insertion_sort*cycles}}"
else
  puts "Tests failed.  Let's figure out what's killing our progress here..."
end

