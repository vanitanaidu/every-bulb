class Product < ApplicationRecord

  has_many :line_products
  has_many :carts, through: :line_products

  has_attached_file :image,
                    :styles => { small: "64x64", med: "100x100", large: "200x200" },
                    :bucket => "to-store-images-for-learn"

  validates :image, attachment_presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :date_delivered, presence: true

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_uniqueness_of :date_delivered
  validate :delivery_date_cannot_be_in_the_past


    def self.date_match
      Product.where('DATE(date_delivered) = ?', Date.today).take
    end


    def delivery_date_cannot_be_in_the_past
      if date_delivered.present? && date_delivered < Date.today
       end
    end

    def delivery_date
      self.date_delivered.strftime("%B %e, %Y")
    end

end
