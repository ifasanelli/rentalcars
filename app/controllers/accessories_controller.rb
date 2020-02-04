class AccessoriesController < ApplicationController
  def index
    @accessories = Accessory.all
  end

  def show
    @accessory = Accessory.find(params[:id])
  end

  def new
    @accessory = Accessory.new
  end

  def create
    @accessory = Accessory.new(accessory_params)
    if @accessory.save
      redirect_to @accessory
    else
      render :new
    end
  end

  private

  def accessory_params
    params.require(:accessory).permit(:name, :full_description, :price, :picture)
  end

end
