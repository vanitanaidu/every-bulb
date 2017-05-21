class LineProductsController < ApplicationController


  def create

    @cart = current_user.current_cart ||= Cart.new
    @cart.add_product(params)

    if @cart.save
       redirect_to cart_path(@cart)
      # render partial: 'carts/shopping_bag', locals: { order: @cart }
    else
      flash[:error] = 'There was a problem adding this item to your shopping bag.'
      redirect :back
    #  @cart = current_user.current_cart ||= Cart.new

    #  @line_product = @cart.line_products.new
    #  @line_product.quantity = params[:line_product][:quantity]
     #
    #  @line_product.product_id = params[:product_id]
    #  @line_product.save
     #
     #
    #  @cart.add_product(params[:product_id])
    #  @cart.save

    end
  end

  #
  # def update
  #   @line_product = line_product.update(quantity: params[:line_product][:quantity]) if @line_product
  #
  #   if @line_product.save
  #     render json: { itemPrice: @line_product.quantity * @line_product.product.price, subtotal: @cart.total_price }
  #   else
  #     flash.now[:error] = 'There was a problem updating your shopping bag.'
  #   end
  # end
  #
  # def destroy
  #   @ordered_item.destroy
  #   render json: { order_total: "$%.2f" % @cart.total_price }
  # end
  #
  # private
  #
  #   def set_ordered_item
  #     @ordered_item = @cart.ordered_items.find_by(id: params[:item_id])
  #   end


end
