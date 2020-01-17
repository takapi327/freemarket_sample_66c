class Image < ApplicationRecord

  belongs_to :product, optional: true
  
end
