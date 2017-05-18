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
        redirect_to product_path(@product)
      else
        @product.errors.inspect
        render :new
      end
  end

  def show
    binding.pry
    @product = Product.find(params[:id])
  end




  private

    def product_params
      params.require(:product).permit(:name, :description, :date_delivered, :image)
    end

end
