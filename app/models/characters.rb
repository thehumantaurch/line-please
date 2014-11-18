class Characters < ActiveRecord::Base
  belongs_to :script
  has_many :lines
end
