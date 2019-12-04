class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :likes
  mount_uploader :image, ImageUploader

  # current_userがいいねしているかどうかを判定してくれる
  def like_by?(user)
    likes.where(user_id: user.id).exists?
  end

end
