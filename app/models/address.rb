class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :zip, :prefectures, :city, :number, presence: true
end