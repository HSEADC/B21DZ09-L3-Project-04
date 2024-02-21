class AddUserIdToOnboardings < ActiveRecord::Migration[7.0]
  def change
    add_column :onboardings, :user_id, :integer
  end
end
