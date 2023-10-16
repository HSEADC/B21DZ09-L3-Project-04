class AddThemeToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :theme, :string
  end
end
