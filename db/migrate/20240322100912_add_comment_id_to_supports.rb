class AddCommentIdToSupports < ActiveRecord::Migration[7.0]
  def change
    add_column :supports, :comment_id, :integer
  end
end
