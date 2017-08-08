class RestmanagersController < ProductsController
  def index
    @restmanagers = Restmanager.all
    @restmanager = Restmanager.new
  end

  def new
    @restmanager = Restmanager.new
  end

  def import
  end

  def update
  end

  def create
  end

  def restmanager_params
    params.require(:restmanager).permit(:Title, :Process, :running, :export)
  end
end
