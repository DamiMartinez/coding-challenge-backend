class Zombie < ApplicationRecord
  has_many :zombie_armor, dependent: :destroy
  has_many :zombie_weapon, dependent: :destroy

  # You must put a name and it must be unique
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
end
