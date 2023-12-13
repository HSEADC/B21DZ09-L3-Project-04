class RemoveAvatarFromAnswer < ActiveRecord::Migration[7.0]
  def change
    remove_column :answers, :avatar, :string
  end
end
