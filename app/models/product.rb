class Product < ApplicationRecord

  #データベースに保存されなかった場合には、各自コメントアウトを行い確認してください。
  belongs_to :user, optional: true
  has_many :categorys
  has_many :brands
  has_many :areas
  has_many :likes
  has_many :comments
  has_many :images
  validates :user_id, presence: true
  validates :price, presence: true
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :areas
end
