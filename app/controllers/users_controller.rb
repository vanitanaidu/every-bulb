class UsersController < ApplicationController

  def new

    current_user.addresses.build(address_type: "Shipping")
    current_user.addresses.build(address_type: "Billing")
    current_user.messages.build

  
  end


  def update


    current_user.update_attributes(user_params)

    if current_user.save
      redirect_to current_user
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
