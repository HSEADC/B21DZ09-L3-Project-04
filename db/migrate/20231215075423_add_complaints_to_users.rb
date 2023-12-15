class AddComplaintsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :complaints, :integer
  end
end
