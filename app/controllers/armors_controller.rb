class ArmorsController < ApplicationController
  def new
    @armor = Armor.new
  end

  def index
    @armors = Armor.all
    render json: @armors
  end

  def create
    @armor = Armor.new(armor_params)
    if @armor.save
      render json: @armor
    else
      render status: 400, json: {error: 'Something went wrong :('}
    end
  end

  def show
    @armor = Armor.find(params[:id])
    render json: @armor
  end

  def update
    @armor = Armor.find(params[:id])
    if @armor.update(armor_params)
      render json: @armor
    else
      render status: 400, json: {error: 'Something went wrong :('}
    end
  end

  def destroy
    @armor = Armor.find(params[:id])
    if @armor.destroy
      render status: 200, json: {status: 'Successful'}
    else
      render status: 400, json: {error: 'Something went wrong :('}
    end
  end

  private
    def armor_params
      params.require(:armor).permit(:name, :defense_points, :durability, :price)
    end
end
