class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item, optional: true

  validates :content, presence: true, unless: :image?
end