class AddRefToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :ref, :boolean
  end
end
