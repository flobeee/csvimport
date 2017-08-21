class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def import
    Product.import(params[:file], params[:export], params[:site], params[:credentials], params[:object], params[:fieldname], params[:fieldto])
    redirect_to root_url, notice: "Api messages running."
  end

  def product_params
    params.require(:product).permit(:Title, :Process, :running, :export)
  end
end
