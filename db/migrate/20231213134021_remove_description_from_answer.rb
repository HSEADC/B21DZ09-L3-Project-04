class RemoveDescriptionFromAnswer < ActiveRecord::Migration[7.0]
  def change
    remove_column :answers, :description, :string
  end
end
