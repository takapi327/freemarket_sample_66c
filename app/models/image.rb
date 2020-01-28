class Image < ApplicationRecord

  mount_uploader :image, ImageUploader
  belongs_to :product, optional: true

  # validates :image, presence: true
  
end
