class UsersController < ApplicationController


  def thank_you
    cart.checkout
    cart.delete
    sign_out_and_redirect(current_user)
    flash[:notice] = "Your order was submitted. Thank you for your business!"
  end

  def show
  end

    private

    def cart
      current_user.current_cart
    end


end
