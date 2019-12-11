class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates :tweet_id,   presence: true
  validates :user_id,    presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true
end
