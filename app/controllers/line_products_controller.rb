class LineProductsController < ApplicationController
  helper_method :product

    def new
      @line_product = product.line_products.build
    end

    def create
      cart = current_user.current_cart ||= Cart.new
      # @cart.delete_past_product
      @line_product = cart.add_product(line_params)
      if @line_product.save
        redirect_to cart_path(current_user.current_cart)
      else
        render :new
      end
    end


    def show
    end

    private

      def product
        Product.date_match
      end



      def line_params
        params.require(:line_product).permit(:quantity, :product_id)
      end


end


    # <!-- <% if object.errors.any? %>
    #   <h2> Whoops! </h2>
    #   <div id="error_explanation" class= "fields_with_errors">
    #     <h2> <%= number_to_word(object.errors.count) %> error(s) prevented this object from being saved: </h2>
    #     <ul>
    #     <% object.errors.full_messages.each do |message| %>
    #       <li style="color:red;"> <%= message %> </li>
    #       <br>
    #     <% end %>
    #     </ul>
    #   </div>
    # <% end %> -->
