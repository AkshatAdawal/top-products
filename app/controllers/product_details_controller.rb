class ProductDetailsController < ApplicationController
  respond_to :json

  def top_products
    top_products = TopAccessedProducts.top_products(params[:count])
    render status: 200,
    json: {
      data: top_products
    }
  end

  def create
    p = Product.find_or_create_by(product_params.to_h)

    TopAccessedProducts.add_product(product: p)

    render status: 200,
    json: {
      product: p
    }
  end

  private
  def product_params
    @params ||= params.require(:product).permit(:product_type, :id, :category, :custom_id)
  end
end
