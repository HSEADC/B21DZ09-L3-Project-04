class AddInSearchToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :in_search, :boolean
  end
end
