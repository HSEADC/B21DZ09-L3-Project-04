class RemoveCoverFromAnswers < ActiveRecord::Migration[7.0]
  def change
    remove_column :answers, :cover, :string
  end
end
