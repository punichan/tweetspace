class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :tweets
  has_many :comments
  has_many :likes
  mount_uploader :avater, AvaterUploader

  has_many active_relationships, class_name: "Relationship"
  has_many passive_relationships, class_name: "Relationship"
end
