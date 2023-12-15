class AddWinnerToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :winner, :boolean
  end
end
