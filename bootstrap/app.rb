require 'sinatra/base'
# いちいち再起動メンドイので
require 'sinatra/reloader'
require 'slim'

class MyApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    slim :index
  end
end
