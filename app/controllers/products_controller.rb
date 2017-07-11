class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def import
    Product.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end
end
