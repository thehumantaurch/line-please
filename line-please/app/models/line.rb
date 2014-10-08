class Line < ActiveRecord::Base
  belongs_to :scene_character
  has_one :character, through: :scene_character
  has_one :scene, through: :scene_character
end