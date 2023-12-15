class AddTaskOfDayToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :task_of_day, :boolean
  end
end
