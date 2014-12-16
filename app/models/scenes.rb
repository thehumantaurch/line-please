class Scenes < ActiveRecord::Base
  belongs_to :script
  validates :script_id, presence: true
end
