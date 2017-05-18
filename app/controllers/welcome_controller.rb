class WelcomeController < ApplicationController
  #  before_action :authenticate_user!

  def home
    @products = Product.all
  end

 # (<%= product.date_delivered.strftime("%B %e, %Y") %>)


# to render partials
# This is the index page!
# <%=  render 'layouts/daily_pick', locals: {@product: @product} %>

    # Today's flower pick (<%= date_today %>)
    # def require_admin
    #   if !current_user.try(:admin?)
    #    redirect_to welcome_path
    #   end
    # end



end
