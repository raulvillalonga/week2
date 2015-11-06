#com es un each por dentro


class Array
  def my_each
    i = 0
    while i < self.size
      yield(self[i])
      i+=1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.size
      yield(self[i], i)
      i+=1
    end
    self
  end

    def my_select
    i = 0
    items = []
    while i < self.size
      if yield(self[i])
        item << self[i]
      end
      i+=1
    end
    items
  end

  def my_select2
    return self unless block_given?
    new_array =[]
    my_each {|i| new_array << i if yield(i)}
    new_array
  end

  def my_map
    return self unless block_given?
    new_array =[]
    my_each {|i| new_array << yield(i)}
    new_array
  end

  def my_map_proc
    return self unless block_given?
    new_array =[]
    my_each {|i| new_array << yield(i)}
    new_array
  end
  def my_greeting(generic_poc)
    greeting = "Hello"
end


#arr = [1,2,3,4,5,6,7,8].my:my_select2 {|num| num.even?}
#puts arr

arr = [1,2,3,4,5].my_map do |num|
  num = num + 1
end

puts arr