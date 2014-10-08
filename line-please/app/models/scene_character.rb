class SceneCharacter < ActiveRecord::Base
  validates_uniqueness_of :character_id, :scope => :scene_id
  has_one :line
  belongs_to :character
  belongs_to :scene
  has_one :script, through: :scene
end