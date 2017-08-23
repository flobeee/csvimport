class ProductsController < ApplicationController
  def index
    @products = Product.where(recordid: '302').paginate(:page => params[:page], :per_page => 10)
  end

  def import
    Product.import(params.require[:file], params[:export], params.require[:site], params.require[:credentials], params[:object], params[:fieldname], params[:fieldto])
    redirect_to root_url, notice: "Api messages running."
  end

  def product_params
    params.require(:product).permit(:Title, :Process, :running, :export)
  end
end
