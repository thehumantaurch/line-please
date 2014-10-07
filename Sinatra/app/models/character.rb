class Character < ActiveRecord::Base
  has_many :lines, through: :character_scene
  has_many :scenes, through: :character_scene
end
