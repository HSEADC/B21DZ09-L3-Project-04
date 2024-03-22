class AddAnswerIdToSupports < ActiveRecord::Migration[7.0]
  def change
    add_column :supports, :answer_id, :integer
  end
end
