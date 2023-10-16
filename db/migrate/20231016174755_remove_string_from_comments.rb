class RemoveStringFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :string, :string
  end
end
