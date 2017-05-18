class Product < ApplicationRecord

  has_many :line_products
  has_many :carts, through: :line_products

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }


validates :image, :attachment_presence => true
validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
