class RemoveImageFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :image, :string
  end
end
