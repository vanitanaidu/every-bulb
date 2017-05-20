class Product < ApplicationRecord

  has_many :line_products
  has_many :carts, through: :line_products

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

  validates :image, :attachment_presence => true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :date_delivered, uniqueness: true
  validate :delivery_date_cannot_be_in_the_past

  accepts_nested_attributes_for :line_products


    def self.date_match
      Product.where('DATE(date_delivered) = ?', Date.today).take
    end


    def delivery_date_cannot_be_in_the_past
      if date_delivered.present? && date_delivered < Date.today
        errors.add(:date_delivered, "can't be in the past")
      end
    end

    def delivery_date
      self.date_delivered.strftime("%B %e, %Y")
    end

end
