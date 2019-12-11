class Relationship < ApplicationRecord
  belongs_to :following, class_name: "User"
  belongs_to :follower, class_name: "User"

  validates :created_at, presence: true
  validates :updated_at, presence: true
end
