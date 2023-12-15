class AddHasComplaintsToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :has_complaints, :boolean
  end
end
