class Item < ApplicationRecord
  belongs_to :user
  belongs_to :size
  belongs_to :category
  belongs_to :delivery
  belongs_to :brand
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  has_many :comments, dependent: :destroy
  validates :category_id, :delivery_id, :name, :introduction, :price, :status, :seller_id, presence: true
end
