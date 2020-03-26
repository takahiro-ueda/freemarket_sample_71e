class Item < ApplicationRecord
  belongs_to :user
  belongs_to :items_condition
  belongs_to :size
  belongs_to :category
  belongs_to :delivery
  belongs_to :brand
  has_many :item_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :size, :category, :delivery, :brand, :name, :introduction, :price, :status, presence: true
end
