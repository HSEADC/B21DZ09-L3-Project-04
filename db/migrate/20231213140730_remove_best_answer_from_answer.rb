class RemoveBestAnswerFromAnswer < ActiveRecord::Migration[7.0]
  def change
    remove_column :answers, :best_answer, :string
  end
end
