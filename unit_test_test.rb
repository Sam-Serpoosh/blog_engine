require_relative "./unit_test"

class WasCalled < UnitTest
  attr_reader :was_called
  def test_method_will_be_called
    @was_called = true
  end
end

def run_tests
  was_called = WasCalled.new
  was_called.run
  raise Exception if !was_called.was_called
end
