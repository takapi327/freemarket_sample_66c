class Product < ApplicationRecord

  #データベースに保存されなかった場合には、各自コメントアウトを行い確認してください。
  belongs_to :user, optional: true
  belongs_to :category
  has_many :likes
  has_many :comments
  has_many :images, dependent: :delete_all
  validates :user_id, presence: true
  validates :price, presence: true
  accepts_nested_attributes_for :images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :day
  belongs_to_active_hash :burden
  belongs_to_active_hash :area

  def self.search(search)
    return Product.all unless search
    Product.where(['name LIKE ?', "%#{search}%"])
  end
end
