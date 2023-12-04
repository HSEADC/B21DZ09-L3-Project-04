class AddVectorRegularityToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :vector_regularity, :string
  end
end
