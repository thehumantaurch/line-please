class Line < ActiveRecord::Base
  belongs_to :character_scene
  has_one :character, through: :character_scene
  has_one :scene, through: :character_scene
end
