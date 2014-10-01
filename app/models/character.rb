class Character < ActiveRecord::Base
  belongs_to :user
  has_many :lines
  has_many :scenes, through: :scene_characters
end
