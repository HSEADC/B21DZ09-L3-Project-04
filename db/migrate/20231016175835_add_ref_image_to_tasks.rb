class AddRefImageToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :ref_image, :string
  end
end
