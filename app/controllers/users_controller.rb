class UsersController < ApplicationController


  def thankyou
    current_user.current_cart.checkout
    current_user.current_cart.delete

  end


end
