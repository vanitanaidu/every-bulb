class LineProductsController < ApplicationController

    def new
      @product = Product.date_match
      @line_product = @product.line_products.build
    end

    def create
      @cart = current_user.current_cart ||= Cart.new
      # @cart.delete_past_product
      @cart.add_product(line_params)
      if @cart.save
        redirect_to @cart
      else
        flash[:error] = "You can't order more than 2 bouquets."
        render :new
      end
    end

    private

      def line_params
        params.require(:line_product).permit(:quantity, :product_id)
    end


end
