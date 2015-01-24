class Character < ActiveRecord::Base
  belongs_to :script
  has_many :lines
  validates :script_id, presence: true
end
