class RemoveDescriptionFromTask < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :description, :string
  end
end
