class Cart < ApplicationRecord

  belongs_to :user

  has_many :line_products
  has_many :products, through: :line_products


end
