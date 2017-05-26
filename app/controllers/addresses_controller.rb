class AddressesController < ApplicationController


  def new
    current_user.addresses.build(address_type: "Shipping")
    current_user.addresses.build(address_type: "Billing")
    current_user.messages.build
  end


  def create
    if current_user.update(address_params)
      flash[:notice] = "Success!"
      redirect_to user_addresses_path(current_user)
    else
      flash[:error] = "Not Successful"
      render :new
    end

    # @user = current_user.update(address_params)
    #   if @user
    #     flash[:notice] = "Success!"
    #     redirect_to user_addresses_path(current_user)
    #   else
    #     flash[:error] = "Not Successful"
    #     render :new`
    #
    # end
  end

    def index
      @shipping_add = current_user.addresses.find_by(address_type: "Shipping")
      @billing_add = current_user.addresses.find_by(address_type: "Billing")
      @message = current_user.messages.last
    end


  private




    def address_params
      params.require(:user).permit(:email, :addresses_attributes => [:street_1, :street_2, :city, :state, :zip_code, :address_type], :messages_attributes => [:content])
    end


  # <% if message.object.errors.any? %>
  #   <div id="error_explanation">
  #     <h2>
  #       <%= pluralize(message.object.errors.count, "error") %>
  #       prohibited this product from being saved:
  #     </h2>
  #
  #     <ul>
  #     <% message.object.errors.full_messages.each do |msg| %>
  #       <li><%= msg %></li>
  #     <% end %>
  #     </ul>
  #   </div>
  # <% end %>








    # <% if address.object.errors.any? %>
    #   <div id="error_explanation">
    #     <h2>
    #       <%= pluralize(address.object.errors.count, "error") %>
    #       prohibited this product from being saved:
    #     </h2>
    #
    #     <ul>
    #     <% address.object.errors.full_messages.each do |msg| %>
    #       <li><%= msg %></li>
    #     <% end %>
    #     </ul>
    #   </div>
    # <% end %>




  # def new
  #   @address = Address.new
  #   @address.build_user(address_type: "Shipping")
  #   @address.build_user(address_type: "Billing")
  #
  #   @cart = current_user.current_cart
  #
  # end
  #
  #
  # private
  #
  #   def address_params
  #     params.require(:address).permit(:addresses_attributes => [:street_1, :street_2, :city, :state, :zip_code, :address_type], :messages_attributes => [:id, :content])
  #   end

end
