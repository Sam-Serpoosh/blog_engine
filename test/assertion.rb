class Assertion
  def self.are_equal(obj1, obj2)
    return true if obj1.eql?(obj2)
    raise AssertionError
  end
  
  def self.are_not_equal(obj1 , obj2)
    return true if !obj1.eql?(obj2)
    raise AssertionError
  end
end

class AssertionError < Exception
end
