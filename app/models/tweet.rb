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

  validates :tweet,       presence: true, length: {maximum: 300}
  validates :user_id,     presence: true
  validates :place_id,    presence: true
  validates :category_id, presence: true
  validates :food,        presence: true, length: {maximum: 30}
  validates :price,       presence: true, length: {maximum: 8}, numericality: true
  validates :store,       presence: true, length: {maximum: 30}
  validates :image,       presence: true
end
