class WelcomeController < ApplicationController
  #  before_action :authenticate_user!

  def home
    @products = Product.all
  end






end
