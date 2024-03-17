class CreateMarkers < ActiveRecord::Migration[7.0]
  def change
    create_table :markers do |t|
      t.integer :task_id
      t.integer :user_id

      t.timestamps
    end
  end
end
