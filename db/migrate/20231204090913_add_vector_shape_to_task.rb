class AddVectorShapeToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :vector_shape, :string
  end
end
