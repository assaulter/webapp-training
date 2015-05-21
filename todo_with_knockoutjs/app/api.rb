require 'sinatra/base'
# いちいち再起動メンドイので
require 'sinatra/reloader'
require 'slim'
# activerecord
require 'sinatra/activerecord'
# require models
require_relative 'models/todo'
require 'json'

# db connection setting
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'todos.sqlite3'
)

class MyApi < Sinatra::Base
  enable :method_override

  configure :development do
    register Sinatra::Reloader
  end

  # urlが.json終わりだったらjsonとして返す
  before %r{.+\.json$} do
    content_type 'application/json'
  end

  # 本来はこっちじゃないけど、サンプルとして
  get '/show' do
    slim :show
  end
  # get all todos
  get '/todos.json' do
    todos = Todo.all
    todos.to_json
  end
  # add todo
  post '/todos' do
    params = JSON.parse(request.body.read)
    todo = Todo.new(title: params['title'], done: false)
    todo.save!
    # ホントはエラー処理するんだよ
    {is_ok: true}.to_json
  end
  # finish todo
  post '/todos/:id' do
    todo = Todo.where(id: params[:id]).first
    todo.done = true
    todo.save!
    {is_ok: true}.to_json
  end
end
