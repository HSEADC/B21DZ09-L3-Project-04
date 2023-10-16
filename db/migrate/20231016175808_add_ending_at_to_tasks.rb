class AddEndingAtToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :ending_at, :datetime
  end
end
