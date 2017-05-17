class AdminController < ApplicationController

  def new
    @product = Product.new
  end

end
