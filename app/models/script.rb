class Script < ActiveRecord::Base

  mount_uploader :filepath, PdfFileUploader

  has_many :scenes
  has_many :characters
  has_many :lines
  validates :author, :title, presence: true

end
