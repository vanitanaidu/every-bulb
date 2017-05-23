class DailyPicksController < ApplicationController

  def index
    # binding.pry
    @product = Product.date_match
    # @line_product = @product.line_products

  end


  # <%= link_to new_product_line_product_path(@line_product) do %>
  #      <%= image_tag(@product.image.url(:large)) %>
  #  <% end %>



  #  <p> <%= link_to image_tag @product.image.url(:large), @product.image.url %> <p>








  #   <%= form_for [@product, @line_product], method: :post do |f| %>
  #
  #      <%= f.label :quantity  %>
  #      <%= f.text_field :quantity %>
  # <br>
  #    <%= f.submit "Add to cart" %>
  #    <% end %>
end
