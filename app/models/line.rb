class Line < ActiveRecord::Base
  belongs_to :character
  has_one :script, through: :character
  validates :character_id, presence: true
end
