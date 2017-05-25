class AddressesController < ApplicationController

  def new
    current_user.addresses.build(address_type: "Shipping")
    current_user.addresses.build(address_type: "Billing")
    @messages = current_user.messages.build
    @cart = current_user.current_cart
  end


  def show
    @user = current_user
    @shipping_add = @user.addresses.find_by(address_type: "Shipping")
    @billing_add = @user.addresses.find_by(address_type: "Billing")
    @message = @user.messages.last
  end



  def update
  end





  # def new
  #   @address = Address.new
  #   @address.build_user(address_type: "Shipping")
  #   @address.build_user(address_type: "Billing")
  #
  #   @cart = current_user.current_cart
  #
  # end
  #
  #
  # private
  #
  #   def address_params
  #     params.require(:address).permit(:addresses_attributes => [:street_1, :street_2, :city, :state, :zip_code, :address_type], :messages_attributes => [:id, :content])
  #   end

end
