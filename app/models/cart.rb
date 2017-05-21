class Cart < ApplicationRecord

  belongs_to :user

  has_many :line_products
  has_many :products, through: :line_products



  def total
      self.line_products.each do |line_product|
        binding.pry
        total += line_product.product.price * line_product.quantity
      end
        total
    end


    def add_product(params)
      current_product = line_products.find_by(product_id: params[:product_id])

        if current_product
          current_product.quantity += params[:line_product][:quantity].to_i
          current_product.save
        else
          current_product = line_products.new
          current_product.quantity = params[:line_product][:quantity]
          current_product.product_id = params[:product_id]
          current_product.save
        end
          current_product
        end

    # current_item = line_items.find_by(product_id: product_id)
    #    if current_item
    #        current_item.quantity += line_item.quantity.to_i
    #    else
    #        current_item = line_items.build(product_id: product_id)
    #    end
    #    current_item

end
