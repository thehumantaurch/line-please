class CharacterScene < ActiveRecord::Base
  has_one :scene
  has_one :character
  has_many :lines
end
