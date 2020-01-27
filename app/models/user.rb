class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  mount_uploader :avater, AvaterUploader

  has_many :comments,     dependent: :delete_all
  has_many :messages,     dependent: :delete_all
  has_many :tweets,       dependent: :delete_all

  has_many :likes,        dependent: :delete_all
  has_many :like_tweets,  through: :likes, source: :tweet

  has_many :active_relationships,  class_name: "Relationship", foreign_key: :following_id
  has_many :followings,            through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers,             through: :passive_relationships, source: :following

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  validates :name,    presence: true, length: {maximum: 8}
  validates :profile, length: {maximum: 300}
end
