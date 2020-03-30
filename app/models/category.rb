class Category < ApplicationRecord
  has_ancestry
  belongs_to :size
  has_many :items
end
