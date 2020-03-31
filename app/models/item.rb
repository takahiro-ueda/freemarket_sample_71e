class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :payer
  belongs_to_active_hash :delivery
  belongs_to_active_hash :duration
  belongs_to_active_hash :status
  belongs_to :user, optional: true
  belongs_to :size, optional: true
  belongs_to :category
  belongs_to :brand, optional: true
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  has_many :comments, dependent: :destroy
  validates :category_id, :name, :introduction, :price, :seller_id, presence: true
end
