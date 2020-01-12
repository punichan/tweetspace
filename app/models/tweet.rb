class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :place

  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :comment_users, through: :comments, source: :user
  has_many :likes, dependent: :delete_all
  has_many :like_users, through: :likes, source: :user
  
  # current_userがいいねしているかどうかを判定してくれる
  def like_by?(user)
    likes.where(user_id: user.id).exists?
  end

  validates :tweet, presence: true
  validates :user_id, presence: true
end
