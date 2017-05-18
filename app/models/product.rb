class Product < ApplicationRecord
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

  has_many :line_products
  has_many :carts, through: :line_products

validates :image, :attachment_presence => true
validates_attachment :image, :content_type => { :content_type => "image/jpg" }

end
