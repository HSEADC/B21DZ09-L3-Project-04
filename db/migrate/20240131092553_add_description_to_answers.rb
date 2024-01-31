class AddDescriptionToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :description, :string
  end
end
