class LineProductsController < ApplicationController

    def new
      @product = Product.date_match
      @line_product = @product.line_products.build
    end


  def create
      @cart = current_user.current_cart ||= Cart.new
      @cart.add_product(line_params)
        if @cart.save
          redirect_to cart_path(@cart) #it has to go to line_product show action.. how?
        else
        flash[:error] = 'There was a problem adding this item to your shopping bag.'
        render :new
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

    private

      def line_params
        params.require(:line_product).permit(:quantity, :product_id)
      end


end
