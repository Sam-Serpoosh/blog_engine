class UnitTest
  def initialize(test_object)
    @test_object = test_object
  end
  
  def setup; end

  def run
    test_methods = fetch_test_methods
    test_methods.each do |test_method_name|
      run_test_method(test_method_name)
    end
  end

  def run_test_method(test_method_name)
    setup
    send(test_method_name.to_sym)
  end

  def fetch_test_methods
    methods = @test_object.methods
    methods.select do |method_name|
      method_name.to_s =~ /^test/
    end
  end
end
