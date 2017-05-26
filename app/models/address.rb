class Address < ApplicationRecord

   belongs_to :user

   validates :street_1, presence: true
   validates :city, presence: true
   validates :state, presence: true
   validates :zip_code, presence: true, length: { is: 5 , message: " %{value} must be given please" }






end
