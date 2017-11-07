class ProductsController < ApplicationController

  def home
    @products = Product.all
  end

  def index
    all_products = Product.all
    @products = all_products.sort {|x,y| x.date_delivered <=> y.date_delivered }
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Successfully added new flower!"
      redirect_to @product
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @product = Product.date_match
  end

    private

    def product_params
      params.require(:product).permit(:name, :description, :date_delivered)
    end

end
