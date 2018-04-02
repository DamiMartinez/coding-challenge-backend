class Armor < ApplicationRecord
  has_many :zombie_armor, dependent: :destroy

  # You must put a name and it must be unique
  # validates :name, presence: true,
  #                  uniqueness: { case_sensitive: false }
end
