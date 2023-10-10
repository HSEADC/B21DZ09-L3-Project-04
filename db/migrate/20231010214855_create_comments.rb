class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :task, null: false, foreign_key: true
      t.string :image
      t.string :string

      t.timestamps
    end
  end
end
