class RemoveAnswerStatusFromAnswer < ActiveRecord::Migration[7.0]
  def change
    remove_column :answers, :answer_status, :string
  end
end
