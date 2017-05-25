class LineProduct < ApplicationRecord

  belongs_to :cart
  belongs_to :product

  validates :quantity, numericality: { greater_than: 0, less_than_or_equal_to: 3 }

end
