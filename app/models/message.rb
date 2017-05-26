class Message < ApplicationRecord

  belongs_to :user, :inverse_of => :messages


   validates_associated :user


  validates :content, length: { maximum: 150, too_long: "%{count} characters is maximum allowed"}, allow_blank: true
end
