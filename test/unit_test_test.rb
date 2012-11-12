require_relative "./unit_test"

class TestClass < UnitTest
  attr_reader :number_of_test_methods, :setup_called_count
 
  def initialize
    super(self)
    @number_of_test_methods = 0
    @setup_called_count = 0
  end

  def setup
    @setup_called_count += 1
  end

  def test_method_will_be_called
    @number_of_test_methods += 1
  end

  def test_all_test_methods_will_be_called
    @number_of_test_methods += 1
  end
end

def run_tests
  test_class = TestClass.new
  test_class.run
  raise Exception if test_class.number_of_test_methods != 2
  raise Exception if test_class.setup_called_count != 2
end

run_tests
