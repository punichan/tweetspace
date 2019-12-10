class Tweet < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :likes
  
  # current_userがいいねしているかどうかを判定してくれる
  def like_by?(user)
    likes.where(user_id: user.id).exists?
  end

  validates :tweet, presence: true
  validates :user_id, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true

end
