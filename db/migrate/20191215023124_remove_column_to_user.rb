class RemoveColumnToUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :user_id, :integer
    add_reference :tweets, :user, foreign_key: true
  end
end
