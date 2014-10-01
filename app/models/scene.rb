class Scene < ActiveRecord::Base
  has_many :lines
  has_many :characters, through: :scene_characters
end
