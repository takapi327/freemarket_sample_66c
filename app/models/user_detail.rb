class UserDetail < ApplicationRecord
  belongs_to :user, optional: true
  validates :last_name, :first_name, :last_kana_name, :first_kana_name, :tel, presence: true
end
