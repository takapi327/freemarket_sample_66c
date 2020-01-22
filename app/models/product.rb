class Product < ApplicationRecord

  #データベースに保存されなかった場合には、各自コメントアウトを行い確認してください。
  belongs_to :user, optional: true
  has_many :categories
  has_many :brands
  has_many :areas
  has_many :likes
  has_many :comments
  has_many :images
  validates :user_id, presence: true
  validates :price, presence: true
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :areas
  accepts_nested_attributes_for :categories

  def self.search(search)
    return Product.all unless search
    Product.where(['name LIKE ?', "%#{search}%"])
  end
end
