class Weapon < ApplicationRecord
  has_many :zombie_weapon, dependent: :destroy

  # You must put a name and it must be unique
  # validates :name, presence: true,
  #                  uniqueness: { case_sensitive: false }
end
