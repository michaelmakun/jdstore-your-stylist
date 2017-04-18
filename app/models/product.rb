class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items, source: :cart

  has_many :works, dependent: :destroy
  belongs_to :user
  belongs_to :order
end
