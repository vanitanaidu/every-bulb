class UsersController < ApplicationController

  def new
    @user = current_user
    @user.addresses.build(address_type: "Shipping")
    @user.addresses.build(address_type: "Billing")
    @message = @user.messages.build
    @cart = current_user.current_cart

  end


  def create
    @user = User.new(user_params)
    @user.addresses_attributes = params[:user][:addresses_attributes]
    @user.messages_attributes = params[:user][:messages_attributes]

    if @user.save
      redirect_to @user
    else
      puts "some error"
      render :new
    end

  end


  def show
  end






  private

    def user_params
      params.require(:user).permit(:addresses_attributes => [:street_1, :street_2, :city, :state, :zip_code, :address_type], :messages_attributes => [:content])
    end


end
