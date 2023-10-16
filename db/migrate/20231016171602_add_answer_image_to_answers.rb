class AddAnswerImageToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :answer_image, :string
  end
end
