class AddTaskIdToAnswer < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :task_id, :integer
  end
end
