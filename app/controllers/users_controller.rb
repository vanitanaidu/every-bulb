class UsersController < ApplicationController

  def new
    @user = current_user
    @user.addresses.build(address_type: "Shipping")
    @user.addresses.build(address_type: "Billing")
    @user.messages.build

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
      params.require(:user).permit(:id, :email, :addresses_attributes => [:user_id, :street_1, :street_2, :city, :state, :zip_code, :address_type], :messages_attributes => [:user_id, :content])
    end


end
