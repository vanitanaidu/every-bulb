class Address < ApplicationRecord

   belongs_to :user


   validates :street_1, presence: { message: "must be given please" }
   validates :city, presence: { message: "must be given please" }
   validates :state, presence: { message: "must be given please" }
   validates :zip_code, presence: true, length: { is: 5 , message: "must be given please" }





end
