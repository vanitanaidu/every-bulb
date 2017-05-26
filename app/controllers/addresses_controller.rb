class AddressesController < ApplicationController


  def new
    current_user.addresses.build(address_type: "Shipping")
    current_user.addresses.build(address_type: "Billing")
    current_user.messages.build
  end

  def create
    if current_user.update(address_params)
      flash[:notice] = "Your Order Was Successful"
      redirect_to user_addresses_path(current_user)
    else
      flash[:error] = "Sorry. Your Order Did Not Go Through"
      render :new
    end
  end

    def index
      @shipping_add = current_user.addresses.find_by(address_type: "Shipping")
      @billing_add = current_user.addresses.find_by(address_type: "Billing")
      @message = current_user.messages.last
    end


  private

    def address_params
      params.require(:user).permit(:email, :addresses_attributes => [:street_1, :street_2, :city, :state, :zip_code, :address_type], :messages_attributes => [:content])
    end


end
