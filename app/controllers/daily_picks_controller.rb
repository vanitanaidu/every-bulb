class DailyPicksController < ApplicationController

  def index

    @product = Product.date_match
    @line_product = @product.line_products.build

  end



    # <p> <%= link_to image_tag @product.image.url(:large), @product.image.url %> <p>






  #   <%= form_for [@product, @line_product], method: :post do |f| %>
  #
  #      <%= f.label :quantity  %>
  #      <%= f.text_field :quantity %>
  # <br>
  #    <%= f.submit "Add to cart" %>
  #    <% end %>
end
