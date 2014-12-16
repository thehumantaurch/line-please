class Scripts < ActiveRecord::Base
  has_many :scenes
  has_many :characters
  has_many :lines
  validates :author, :title, presence: true
end
