class DailyPickController < ApplicationController

  def index
    @products = Product.all
    @last_product = @products.last
  end


# <%= image_tag @last_product.image.url %>

end
