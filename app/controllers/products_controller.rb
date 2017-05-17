class ProductsController < ApplicationController

  def new
    if current_user.admin?
      redirect_to new_admin_path
    end
    @product = Product.new
  end


  def create

    @product = Product.new(product_params)

      if @product.save
        redirect_to @product
      else
        render 'admin/new'
      end
  end

  def show
    @product = Product.find(params[:id])
  end



  private

    def product_params
      params.require(:product).permit(:name, :description, :image)
    end

end
