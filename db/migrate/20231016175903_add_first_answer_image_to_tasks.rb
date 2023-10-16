class AddFirstAnswerImageToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :first_answer_image, :string
  end
end
