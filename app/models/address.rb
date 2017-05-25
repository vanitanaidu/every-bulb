class Address < ApplicationRecord

  belongs_to :user

    validates :street_1, presence: true
    validates :street_2, uniqueness: true, allow_blank: true
    validates :city, presence: true
    validates :state, presence: true, uniqueness: true, length: { is: 2 }
    validates :zip_code, presence: true, length: { is: 5 }


end
