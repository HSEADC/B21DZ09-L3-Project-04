class RemoveNameFromAnswer < ActiveRecord::Migration[7.0]
  def change
    remove_column :answers, :name, :string
  end
end
