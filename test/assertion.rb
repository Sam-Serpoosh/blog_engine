class Assertion
  def self.are_equal(obj1, obj2)
    return true if obj1.eql?(obj2)
    raise AssertionError, expectation_message(obj1, obj2)
  end

  def self.are_not_equal(obj1 , obj2)
    return true if !obj1.eql?(obj2)
    raise AssertionError, expectation_message(obj1, obj2)
  end

  def self.array_equal(arr1, arr2)
    raise AssertionError if arr1.count != arr2.count
    arr1.each_with_index do |item, index|
      raise AssertionError if !arr1[index].eql?(arr2[index])
    end
    true
  end

  def self.expectation_message(expected, actual)
    "expected was: \"#{expected}\" actual was: \"#{actual}\""
  end
end

class AssertionError < Exception; end
