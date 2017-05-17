class WelcomeController < ApplicationController


  #  before_action :authenticate_user!


  def index

    @products = Product.all
  end


    private

    # Today's flower pick (<%= date_today %>)
    # def require_admin
    #   if !current_user.try(:admin?)
    #    redirect_to welcome_path
    #   end
    # end



end
