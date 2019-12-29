class AddDitailsToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :place_id, :integer, null:false
    add_column :tweets, :category_id, :integer, null:false
    add_column :tweets, :food, :string , null:false
    add_column :tweets, :price, :integer, null:false
    add_column :tweets, :store, :string, null:false
  end
end
