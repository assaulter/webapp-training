class UpdateTodo < ActiveRecord::Migration
  def change
    add_column :todos, :category, :text
  end
end
