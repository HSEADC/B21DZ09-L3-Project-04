class AddActiveToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :active, :boolean
  end
end
