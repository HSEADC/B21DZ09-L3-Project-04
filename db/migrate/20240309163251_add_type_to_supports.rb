class AddTypeToSupports < ActiveRecord::Migration[7.0]
  def change
    add_column :supports, :type, :string
  end
end
