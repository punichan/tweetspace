class RemoveImagesFromTweets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :image, :string
  end
end
