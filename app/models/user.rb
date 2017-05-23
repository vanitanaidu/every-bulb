class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :carts
  has_one :current_cart, class_name: 'Cart'
  has_many :addresses
  has_many :messages


  def addresses_attributes=(addresses_attributes)
    raise addresses_attributes.inspect
    addresses_attributes.each do |i, address_attributes|
      self.addresses.build(address_attributes)
    end
  end


  def messages_attributes=(messages_attributes)
    messages_attributes.each do |i, message_attributes|
      self.messages.build(message_attributes)
    end
  end



end
