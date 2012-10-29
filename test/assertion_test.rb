require_relative "./unit_test"
require_relative "./assertion" 

class AssertionTest < UnitTest
  def initialize
    super(self)
  end

  def test_assertion_equal_raises_exception_in_not_equal_case
    begin 
      Assertion.are_equal(1, 2)
    rescue AssertionError
      return
    end
    raise Exception
  end

  def test_assertion_equal_returns_true_in_equal_case
    equality = Assertion.are_equal(1, 1)
    raise Exception if equality != true
  end

  def test_assertion_not_equal_raise_exception_in_equal_case
    begin
      Assertion.are_not_equal(1, 1)
    rescue AssertionError
      return
    end
    raise Exception
  end

  def test_assertion_not_equal_returns_true_in_not_equal_case
    inequality = Assertion.are_not_equal(1, 2)
    raise Exception if inequality != true
  end
end

def run_test
  assertion_test = AssertionTest.new
  assertion_test.run
end

run_test
