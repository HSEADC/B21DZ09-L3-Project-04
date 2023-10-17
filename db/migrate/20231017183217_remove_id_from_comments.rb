class RemoveIdFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :id, :integer
  end
end
