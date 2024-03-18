class AddTgToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :tg, :string
  end
end
