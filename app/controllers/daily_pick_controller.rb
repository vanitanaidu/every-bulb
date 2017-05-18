class DailyPickController < ApplicationController

  def index
    @products = Product.all
    @last_product = @products.last
  end




end
