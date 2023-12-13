class DropFavourites < ActiveRecord::Migration[7.0]
  def change
    drop_table :favourite
  end
end
