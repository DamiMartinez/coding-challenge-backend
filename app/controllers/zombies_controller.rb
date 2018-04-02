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
        if @zombie.zombie_weapon_ids.size != 0
          @zombie.zombie_weapon.last.update(weapon_id: params[:weapon_id])
        else
          @zombie.zombie_weapon.create(zombie_id: @zombie.id, weapon_id: params[:weapon_id])
        end
        if @zombie.zombie_armor_ids.size != 0
          @zombie.zombie_armor.last.update(armor_id: params[:armor_id])
        else
          @zombie.zombie_armor.create(zombie_id: @zombie.id, armor_id: params[:armor_id])
        end
        render json: {zombie: @zombie, zombie_weapon: @zombie.zombie_weapon.last, zombie_armor: @zombie.zombie_armor.last}

      elsif params.has_key?(:weapon_id)
        if @zombie.zombie_weapon_ids.size != 0
          @zombie.zombie_weapon.last.update(weapon_id: params[:weapon_id])
        else
          @zombie.zombie_weapon.create(zombie_id: @zombie.id, weapon_id: params[:weapon_id])
        end
        render json: {zombie: @zombie, zombie_weapon: @zombie.zombie_weapon.last}

      elsif params.has_key?(:armor_id)
        if @zombie.zombie_armor_ids.size != 0
          @zombie.zombie_armor.last.update(armor_id: params[:armor_id])
        else
          @zombie.zombie_armor.create(zombie_id: @zombie.id, armor_id: params[:armor_id])
        end
        render json: {zombie: @zombie, zombie_armor: @zombie.zombie_armor.last}

      else
        render json: {zombie: @zombie}
      end
    else
      render status: 400, json: {error: 'Something went wrong :('}
    end
  end

  def search
    if !params
      @zombies = Zombie.all.order('created_at DESC')
    elsif params[:weapon_id] && params[:armor_id]
      @zombies = Zombie.joins(:zombie_weapon, :zombie_armor).search_by_weapon_armor(params[:name], params[:hit_points], params[:brains_eaten], params[:speed], params[:weapon_id], params[:armor_id]).order("created_at DESC")
    elsif params[:weapon_id]
      @zombies = Zombie.joins(:zombie_weapon).search_by_weapon(params[:name], params[:hit_points], params[:brains_eaten], params[:speed], params[:weapon_id]).order("created_at DESC")
    elsif params[:armor_id]
      @zombies = Zombie.joins(:zombie_armor).search_by_armor(params[:name], params[:hit_points], params[:brains_eaten], params[:speed], params[:armor_id]).order("created_at DESC")
    else
      @zombies = Zombie.search(params[:name], params[:hit_points], params[:brains_eaten], params[:speed]).order("created_at DESC")
    end
    render json: @zombies
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
