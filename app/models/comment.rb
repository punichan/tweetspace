class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates :comment,    presence: true, length: {maximum: 200}
  validates :tweet_id,   presence: true
  validates :user_id,    presence: true
end
