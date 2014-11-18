class Scripts < ActiveRecord::Base
  has_many :scripts
  has_many :characters
  has_many :lines
end
