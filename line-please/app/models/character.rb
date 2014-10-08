class Character < ActiveRecord::Base
  has_many :scene_characters
  has_many :scenes, through: :scene_characters
  has_many :lines, through: :scene_characters
  has_one :script, through: :scene
end