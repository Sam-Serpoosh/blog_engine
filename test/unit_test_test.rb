require_relative "./unit_test"

class WasCalled < UnitTest
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
  was_called = WasCalled.new
  was_called.run
  raise Exception if was_called.test_methods_count != 2
end

run_tests
