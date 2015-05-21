require 'factory_girl'
require 'rspec'
require 'rack/test'

FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]
FactoryGirl.find_definitions

RSpec.configure do |config|
  # .specでFactoryGirlのsyntaxが使える
  config.include FactoryGirl::Syntax::Methods
end
