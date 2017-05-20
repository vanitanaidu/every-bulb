class Cart < ApplicationRecord

  belongs_to :user

  has_many :line_products
  has_many :products, through: :line_products



  def total
      self.line_products.each do |line_product|
        total += line_product.product.price * line_product.quantity
      end
        total
    end


    def add_product(product_id)
      line_product = self.line_products.find_by(product_id: product_id)
         if line_product
           line_product.quantity += 1
           line_product.save
         else
           line_product = self.line_products.build(product_id: product_id)
           line_product.quantity += 1
         end
         line_product
     end
end
