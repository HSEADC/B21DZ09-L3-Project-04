class RemoveUsernameFromAnswer < ActiveRecord::Migration[7.0]
  def change
    remove_column :answers, :username, :string
  end
end
