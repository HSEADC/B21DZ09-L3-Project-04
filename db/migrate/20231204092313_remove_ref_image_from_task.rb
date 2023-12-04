class RemoveRefImageFromTask < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :ref_image, :string
  end
end
