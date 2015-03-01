class Script < ActiveRecord::Base

  mount_uploader :script, ScriptUploader

  has_many :scenes
  has_many :characters
  has_many :lines
  validates :author, :title, :file, presence: true

end
