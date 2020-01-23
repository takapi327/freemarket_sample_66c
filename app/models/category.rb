class Category < ApplicationRecord

  has_many :products
  has_ancestry

  enum name:{
    lady: 1
  }

end
