class Script < ActiveRecord::Base
  has_many :scenes
  has_many :scene_characters, through: :scenes
  has_many :lines, through: :scene_characters
  has_many :characters, through: :scene_characters
end