class RemoveImageFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :image, :string
  end
end
