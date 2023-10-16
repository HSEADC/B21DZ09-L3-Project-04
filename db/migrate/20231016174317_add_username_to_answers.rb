class AddUsernameToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :username, :string
  end
end
