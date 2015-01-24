class Scripts < ActiveRecord::Base

  mount_uploader :pdf_file, PdfFileUploader

  has_many :scenes
  has_many :characters
  has_many :lines
  validates :author, :title, presence: true
end
