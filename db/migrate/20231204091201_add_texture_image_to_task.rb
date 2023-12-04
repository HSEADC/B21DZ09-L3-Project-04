class AddTextureImageToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :texture_image, :string
  end
end
