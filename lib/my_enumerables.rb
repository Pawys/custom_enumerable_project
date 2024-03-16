module Enumerable
  def my_each_with_index
    return self unless block_given?
    index = 0
    self.my_each do |variable|
      yield(variable, index)
      index += 1
    end
  end
  def my_select
    selected = Array.new()
    self.my_each {|var| selected.push(var) if yield(var)}
    selected
  end
  def my_all?
    all = true
    self.my_each {|var| all = false if !yield(var)}
    all
  end
  def my_any?
    any = false
    self.my_each {|var| any = true if yield(var)}
    any
  end
  def my_none?
    return false if self.my_any? {|var| yield(var)}
    true
  end
  def my_count
    count = 0
    if block_given?
      self.each {|var| count += 1 if yield(var)}
    else self.each {count += 1} end
    count
  end
  def my_map
    return self unless block_given?
    map = Array.new()
    self.each do |var|
      map.push(yield(var))
    end
    map
  end
  def my_inject(initial_value = nil)
    memo = initial_value
    self.my_each_with_index do |var, index| 
      if index == 0 && initial_value == nil
      memo = var
      else
      memo = yield(memo, var)
      end
    end
    memo
  end
end
class Array
  def my_each()
    return self unless block_given?
    for variable in self do
      yield(variable)
    end
  end
end

