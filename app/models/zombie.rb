class Zombie < ApplicationRecord
  has_many :zombie_armor, dependent: :destroy
  has_many :zombie_weapon, dependent: :destroy

  # You must put a name and it must be unique
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }

  def self.search_by_weapon_armor(name, hit_points, brains_eaten, speed, weapon_id, armor_id)
    where("zombies.name LIKE ? AND zombies.hit_points LIKE ? AND zombies.brains_eaten LIKE ? AND zombies.speed LIKE ? AND zombie_weapons.weapon_id LIKE ? AND zombie_armors.armor_id LIKE ?", "%#{name}%", "%#{hit_points}%", "%#{brains_eaten}%", "%#{speed}%", "%#{weapon_id}%", "%#{armor_id}%")
  end

  def self.search_by_weapon(name, hit_points, brains_eaten, speed, weapon_id)
    where("zombies.name LIKE ? AND zombies.hit_points LIKE ? AND zombies.brains_eaten LIKE ? AND zombies.speed LIKE ? AND zombie_weapons.weapon_id LIKE ?", "%#{name}%", "%#{hit_points}%", "%#{brains_eaten}%", "%#{speed}%", "%#{weapon_id}%")
  end

  def self.search_by_armor(name, hit_points, brains_eaten, speed, armor_id)
    where("zombies.name LIKE ? AND zombies.hit_points LIKE ? AND zombies.brains_eaten LIKE ? AND zombies.speed LIKE ? AND zombie_armors.armor_id LIKE ?", "%#{name}%", "%#{hit_points}%", "%#{brains_eaten}%", "%#{speed}%", "%#{armor_id}%")
  end

  def self.search(name, hit_points, brains_eaten, speed)
    where("zombies.name LIKE ? AND zombies.hit_points LIKE ? AND zombies.brains_eaten LIKE ? AND zombies.speed LIKE ?", "%#{name}%", "%#{hit_points}%", "%#{brains_eaten}%", "%#{speed}%")
  end
end
