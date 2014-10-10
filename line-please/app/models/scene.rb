class Scene < ActiveRecord::Base
  belongs_to :script
  has_many :scene_characters
  has_many :characters, through: :scene_characters
  has_many :lines, through: :scene_characters
end