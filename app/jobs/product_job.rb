class ProductJob < ApplicationJob
  queue_as :default

  def perform(product_ids)
    products = Product.where(id: product_ids)
  end
end
