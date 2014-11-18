class Lines < ActiveRecord::Base
  belongs_to :character
  belongs_to :script, through: :character
end
