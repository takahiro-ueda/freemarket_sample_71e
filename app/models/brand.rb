class Brand < ApplicationRecord
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :item, allow_destroy: true
end