class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #deviseのデフォルトバリデーションはemail,passwordのみのため、追加しています
  has_many :products
  validates :nickname, presence: true, length: { maximum: 6 }
end
