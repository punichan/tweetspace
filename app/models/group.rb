class Group < ApplicationRecord
  has_many :messages, dependent: :delete_all
end
