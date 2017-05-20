class LineProductsController < ApplicationController

def index


end

  def create
     @cart = current_user.current_cart ||= Cart.new

     @line_product = @cart.line_products.new
     @line_product.quantity = params[:product][:line_product][:quantity]
     @line_product.product_id = params[:product_id]

     @cart.add_product(params[:product_id])
     @cart.save

     redirect_to cart_path(@cart)
  end

  def show

  end

  def update
  end



end
