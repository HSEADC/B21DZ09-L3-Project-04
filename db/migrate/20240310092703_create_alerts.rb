class CreateAlerts < ActiveRecord::Migration[7.0]
  def change
    create_table :alerts do |t|
      t.integer :user_id
      t.integer :count
      t.boolean :passed, default: true
      t.boolean :blocked, default: false

      t.timestamps
    end
  end
end
