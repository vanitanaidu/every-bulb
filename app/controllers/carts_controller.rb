class CartsController < ApplicationController

  def show
    @cart = current_user.current_cart
  end

  def checkout
    cart = current_user.current_cart
    cart.checkout

    redirect_to new_user_address_path(current_user)
  end

  def destroy
    cart = current_user.current_cart
    product = cart.products
    if product
      product.delete_all
    end
    redirect_to cart_path
  end

    private

      def cart_params
        params.require(:cart).permit(:user_id)
      end

    # def update
    #   @line_product = line_product.update(quantity: params[:line_product][:quantity]) if @line_product
    #
    #   if @line_product.save
    #     @line_product.quantity * @line_product.product.price, subtotal: @cart.total_price
    #   else
    #     flash.now[:error] = 'There was a problem updating your shopping bag.'
    #   end
    # end
    #
    # def destroy
    #   @ordered_item.destroy
    #   order_total: "$%.2f" % @cart.total_price
    # end

end
