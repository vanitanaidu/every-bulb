class UsersController < ApplicationController


  def thankyou
    user.checkout
    user.delete
  end

    private

    def user
      current_user.current_cart
    end


end
