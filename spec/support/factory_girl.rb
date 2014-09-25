RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

# Test::Unit
class Test::Unit::TestCase
  include FactoryGirl::Syntax::Methods
end

# MiniTest::Spec
class MiniTest::Spec
  include FactoryGirl::Syntax::Methods
end
