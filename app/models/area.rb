class Area < ApplicationRecord

  belongs_to :product, optional: true
  
end
