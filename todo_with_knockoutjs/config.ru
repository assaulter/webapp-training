require_relative 'app/app'
require_relative 'app/api'

map('/') do
  run MyApp
end

map('/api') do
  run MyApi
end
