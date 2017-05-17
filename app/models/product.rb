class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :line_products
  has_many :carts, through: :line_products

  
end
