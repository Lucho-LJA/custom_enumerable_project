module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    while i < length
      yield self[i], i
      i += 1
    end
    self
  end

  def my_select
    i = 0
    array = []
    while i < length
      if yield self[i]
        array << self[i]
      end
      i +=1
    end
    array
  end
  def my_all?
    i = 0
    opc = true
    while i < length
      unless yield(self[i])
        opc = false
      end
      i +=1
    end
    opc
  end
  def my_any?
    i = 0
    opc = false
    while i < length
      if yield(self[i])
        opc = true
        i = length
      end
      i +=1
    end
    opc
  end
  def my_none?
    i = 0
    opc = true
    while i < length
      if yield(self[i])
        opc = false
      end
      i +=1
    end
    opc
  end
  def my_count(*item)
    if block_given?
      i = 0
      cont = 0
      while i < length
        if yield(self[i])
          cont += 1
        end
        i +=1
      end
      cont
    else
      if item == []
        length
      else
        i = 0
        cont = 0
        while i < length
          if self[i] == item[0]
            cont += 1
          end
          i +=1
        end
        cont
      end
    end
  end
  def my_map
    i = 0
    array = []
    while i < length
      array << yield(self[i])
      i += 1
    end
    array
  end
  def my_inject(*index)
    if block_given?
      if index == []
        i = 1
        result = self.to_a[0]
      else
        result = index[0]
        i = 0
      end
      while i < self.to_a.length
        result =  yield(result,self.to_a[i])
        i += 1
      end
      result
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0
    while i < length
      yield  self[i]
      i += 1
    end
    self
  end
end
