class DailyPicksController < ApplicationController

  def index

    @product = Product.date_match
    @line_product = @product.line_products.build

  end


end
