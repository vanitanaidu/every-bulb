class Address < ApplicationRecord

  belongs_to :user, inverse_of: :addresses

     validates :street_1, presence: true
    # validates :city, presence: true
    # validates :state, presence: true
    # validates :zip_code, presence: true, length: { is: 5 }


end
