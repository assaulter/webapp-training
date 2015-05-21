require_relative 'models/todo'

# db connection setting
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'todos.sqlite3'
)
