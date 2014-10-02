class Scene < ActiveRecord::Base
  belongs_to :script
  has_many :character_scenes
  has_many :lines, through: :character_scenes
  has_many :characters, through: :character_scenes
end
