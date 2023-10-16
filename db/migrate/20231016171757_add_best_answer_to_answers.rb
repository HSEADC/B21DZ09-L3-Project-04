class AddBestAnswerToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :best_answer, :boolean
  end
end
