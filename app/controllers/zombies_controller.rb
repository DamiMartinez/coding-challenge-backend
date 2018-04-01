class ZombiesController < ApplicationController
  def new
    @zombie = Zombie.new
  end

  def index
    @zombies = Zombie.all
    render json: @zombies
  end

  def create
    @zombie = Zombie.new(zombie_params)

    if @zombie.save
      @zombie_weapon = ZombieWeapon.new(zombie_id: @zombie.id, weapon_id: params[:weapon_id])
      @zombie_armor = ZombieArmor.new(zombie_id: @zombie.id, armor_id: params[:armor_id])

      if @zombie_weapon.save && @zombie_armor.save
        render json: {zombie: @zombie, zombie_weapon: @zombie_weapon, zombie_armor: @zombie_armor}
      elsif @zombie_weapon.save
        render json: {zombie: @zombie, zombie_weapon: @zombie_weapon}
      elsif @zombie_armor.save
        render json: {zombie: @zombie, zombie_armor: @zombie_armor}
      else
        render json: {zombie: @zombie}
      end
    else
      render status: 400, json: {error: 'Something went wrong :('}
    end
  end

  def show
    @zombie = Zombie.find(params[:id])
    render json: @zombie
  end

  def update
    @zombie = Zombie.find(params[:id])
    if @zombie.update(zombie_params)
      if params.has_key?(:weapon_id) && params.has_key?(:armor_id)
        @zombie_weapon = ZombieWeapon.where(zombie_id: @zombie.id).last
        @zombie_armor = ZombieArmor.where(zombie_id: @zombie.id).last
        if @zombie_weapon.update(weapon_id: params[weapon_id]) && @zombie_armor.update(armor_id: params[armor_id])
          render json: {zombie: @zombie, zombie_weapon: @zombie_weapon, zombie_armor: @zombie_armor}
        end
      elsif params.has_key?(:weapon_id)
        @zombie_weapon = ZombieWeapon.where(zombie_id: @zombie.id).last
        if @zombie_weapon.update(weapon_id: params[weapon_id])
          render json: {zombie: @zombie, zombie_weapon: @zombie_weapon}
        end
      elsif params.has_key?(:armor_id)
        @zombie_armor = ZombieArmor.where(zombie_id: @zombie.id).last
        if @zombie_armor.update(armor_id: params[armor_id])
          render json: {zombie: @zombie, zombie_armor: @zombie_armor}
        end
      else
        render json: {zombie: @zombie}
      end
    else
      render status: 400, json: {error: 'Something went wrong :('}
    end
  end

  def destroy
    @zombie = Zombie.find(params[:id])
    if @zombie.destroy
      render status: 200, json: {status: 'Successful'}
    else
      render status: 400, json: {error: 'Something went wrong :('}
    end
  end

  private
    def zombie_params
      params.require(:zombie).permit(:name, :hit_points, :brains_eaten, :speed)
    end
end
