class WeaponsController < ApplicationController
  def new
    @weapon = Weapon.new
  end

  def index
    @weapons = Weapon.all
    render json: @weapons
  end

  def create
    @weapon = Weapon.new(weapon_params)
    if @weapon.save
      render json: @weapon
    else
      render status: 400, json: {error: 'Something went wrong :('}
    end
  end

  def show
    @weapon = Weapon.find(params[:id])
    render json: @weapon
  end

  def update
    @weapon = Weapon.find(params[:id])
    if @weapon.update(weapon_params)
      render json: @weapon
    else
      render status: 400, json: {error: 'Something went wrong :('}
    end
  end

  def destroy
    @weapon = Weapon.find(params[:id])
    if @weapon.destroy
      render status: 200, json: {status: 'Successful'}
    else
      render status: 400, json: {error: 'Something went wrong :('}
    end
  end

  private
    def weapon_params
      params.require(:weapon).permit(:name, :attack_points, :durability, :price)
    end
end
