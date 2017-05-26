class CartsController < ApplicationController
  before_action :set_cart, only: [:checkout, :destroy, :show]

  def show

  end

  def checkout
    @cart.checkout
    redirect_to new_user_address_path(current_user) if @cart.valid?
  end

  def destroy
    product = @cart.products
    if product
      product.delete_all
    end
    redirect_to cart_path
  end

    private

    def cart_params
      params.require(:cart).permit(:user_id)
    end

    def set_cart
      @cart = current_user.current_cart
    end


end
