require 'sinatra/base'
# いちいち再起動メンドイので
require 'sinatra/reloader'
require 'slim'

class MyApp < Sinatra::Base
  get '/' do
    slim :index
  end
end
