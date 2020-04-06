class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :payer
  belongs_to_active_hash :delivery
  belongs_to_active_hash :duration
  belongs_to_active_hash :status
  belongs_to_active_hash :trade
  belongs_to :user, optional: true
  belongs_to :size, optional: true
  belongs_to :category
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  has_many :comments, dependent: :destroy
  
  validates :category_id, :name, :introduction, :price, :seller_id,:item_images, presence: true

  validates :name,
    length: { maximum:40, message: "入力は４０文字までです。"}
  validates :introduction,
    length: { maximum:600, message: "入力は６００文字までです。"}
  validates :brand,
    length: { maximum:40, message: "入力は４０文字までです"}
  validates :price,
  inclusion: { in: (300..9999999) , message: "入力は数字のみ300〜9999999までです。"}


end
