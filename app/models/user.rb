class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,:birth_date, presence: true
  has_one :credit
  has_one :address
  has_many :items
  has_many :comments
  has_many :likes, dependent: :destroy
  validates :nickname, length: { maximum: 6 }
end

