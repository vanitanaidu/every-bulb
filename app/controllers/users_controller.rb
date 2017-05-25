class UsersController < ApplicationController

  def update
    current_user.update_attributes(user_params)
    if current_user.save
      redirect_to user_address_path(current_user)
    else
      render :new
    end
  end


    private

      def user_params
        params.require(:user).permit(:id, :email, :addresses_attributes => [:id, :street_1, :street_2, :city, :state, :zip_code, :address_type], :messages_attributes => [:id, :content])
      end

end
