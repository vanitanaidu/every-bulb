class DailyPickController < ApplicationController

  def index
    @product = Product.where('DATE(date_delivered) = ?', Date.today)
  end




end
