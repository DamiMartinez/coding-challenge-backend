class Zombie < ApplicationRecord
  has_many :armors
  has_many :weapons
end
