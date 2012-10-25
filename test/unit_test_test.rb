require_relative "./unit_test"

class TestClass < UnitTest
  attr_reader :test_methods_count
 
  def initialize
    super(self)
    @test_methods_count = 0
  end

  def test_method_will_be_called
    @test_methods_count += 1
  end

  def test_all_test_methods_will_be_called
    @test_methods_count += 1
  end
end

def run_tests
  test_class = TestClass.new
  test_class.run
  raise Exception if test_class.test_methods_count != 2
end

run_tests
