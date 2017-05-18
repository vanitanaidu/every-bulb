class ProductsController < ApplicationController

  def index

    @products = Product.all
  end

  def new
    @product = Product.new
  end


  def create

    @product = Product.new(product_params)
      if @product.save
        flash[:notice] = "Successfully added new photo!"
        redirect_to product_path(@product)
      else
        flash[:alert] = "Error adding new photo!"
        render :new
      end
  end

  def show
    @product = Product.find(params[:id])
    # if product matches product.delivery_time and Time.now, save it and then display it
    # or else save it to the database and go to daily_pick controller index application
    #(the daily_pick index action is gonna go through the databse and check for a product 
    #that matches product.delivery time and Time.now and will display whichever product matches that condition)
    if @product.date_delivered.strftime("%B %e, %Y") == Time.zone.now.strftime("%B %e, %Y")
      render :show
    else
      redirect_to daily_pick_index_path
    end
  end




  private

    def product_params
      params.require(:product).permit(:name, :description, :date_delivered, :image)
    end

end
