class AddVectorFontToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :vector_font, :string
  end
end
