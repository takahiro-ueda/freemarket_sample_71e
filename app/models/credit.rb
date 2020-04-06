class Credit < ApplicationRecord
  belongs_to :user
  validates :user_id, :customer_id, presence: true
end