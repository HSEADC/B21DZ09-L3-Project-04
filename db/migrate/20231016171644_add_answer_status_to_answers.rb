class AddAnswerStatusToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :answer_status, :string
  end
end
