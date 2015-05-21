require 'sinatra'
require 'slim'

get '/' do
  @users = [
    {id: '1', name: 'hoge'},
    {id: '2', name: 'fuga'}
  ]
  slim :index
end