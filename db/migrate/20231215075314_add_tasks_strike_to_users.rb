class AddTasksStrikeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :tasks_strike, :integer
  end
end
