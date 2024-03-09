class AddProblemToSupports < ActiveRecord::Migration[7.0]
  def change
    add_column :supports, :problem, :string
  end
end
