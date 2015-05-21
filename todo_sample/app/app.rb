require 'sinatra/base'
# いちいち再起動メンドイので
require 'sinatra/reloader'
require 'slim'
# activerecord
require 'sinatra/activerecord'
# require models
require_relative 'models/todo'

# db connection setting
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'todos.sqlite3'
)

class MyApp < Sinatra::Base
  enable :method_override

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    slim :index
  end

  # 一覧表示
  get '/todos' do
    @todos = Todo.all
    slim :todos
  end

  # todo追加
  post '/todos' do
    todo = Todo.new(title: params['title'], done: false)
    # ToDo: バリデーションの実装とエラーハンドリング
    todo.save!
    redirect to('/todos')
  end

  # todo完了
  put '/todos/:id' do
    todo = Todo.where(id: params[:id]).first
    todo.done = true
    todo.save!
    redirect to('/todos')
  end
end
