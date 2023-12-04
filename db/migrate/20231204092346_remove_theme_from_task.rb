class RemoveThemeFromTask < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :theme, :string
  end
end
