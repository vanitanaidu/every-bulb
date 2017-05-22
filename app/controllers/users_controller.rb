class UsersController < ApplicationController

  def new
    @user = current_user

    1.times { @user.addresses.build(address_type: "Shipping") }
    1.times { @user.addresses.build(address_type: "Billing") }
    1.times { @user.messages.build }
    @cart = current_user.current_cart

  end


  def update

    @user = current_user
    @user.update_attributes(user_params)

    if @user.save
      redirect_to @user
    else
      render :new
    end

  end

  def show

    @user = current_user
  end





  private

    def user_params
      params.require(:user).permit(:addresses_attributes => [:street_1, :street_2, :city, :state, :zip_code, :address_type], :messages_attributes => [:content])
    end


end
