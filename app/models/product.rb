class Product < ApplicationRecord

  #データベースに保存されなかった場合には、各自コメントアウトを行い確認してください。
  belongs_to :user, optional: true
  belongs_to :category
  has_many :brands
  has_many :areas
  has_many :likes
  has_many :comments
  has_many :images
  validates :user_id, presence: true
  validates :price, presence: true
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :areas
  accepts_nested_attributes_for :category


  enum burden:{
    postage_included: 1,
    postage_not_included: 2
  }

  enum status:{
    start: 1,
    no_noticeable_scratches_or_dirt: 2,
    some_scratches_and_dirt: 3,
    there_are_scratches_and_dirt: 4,
    bad: 5
  }

  enum day:{
    one_two: 1,
    two_three: 2,
    four_seven: 3
  }
  
end
