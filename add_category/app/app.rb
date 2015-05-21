require 'sinatra/base'
# いちいち再起動メンドイので
require 'sinatra/reloader'
require 'slim'
# activerecord
require 'sinatra/activerecord'
# require models
require_relative 'models/todo'

# db connection setting
ActiveRecord::Base.configurations = YAML.load_file('config.yml')['database']
ActiveRecord::Base.establish_connection(:development)

class MyApp < Sinatra::Base
  enable :method_override

  configure :development do
    register Sinatra::Reloader
    enable :sessions
  end

  get '/' do
    slim :index
  end

  # 一覧表示
  get '/todos' do
    @todos = Todo.all
    @errors = session[:messages]
    @categories = Todo.uniq.pluck(:category)

    slim :todos
  end

  # カテゴリ毎表示
  get '/todos/:category' do
    category = params[:category]

    @todos = Todo.where("category = ?", category)

    if @todos.blank?
      redirect to('/todos') and return
    end

    @errors = session[:messages]
    @categories = Todo.uniq.pluck(:category)

    slim :todos
  end

  # todo追加
  post '/todos' do
    session.clear
    todo = Todo.create(title: params['title'], done: false, category: params['category'])
    session[:messages] = todo.errors.messages
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
