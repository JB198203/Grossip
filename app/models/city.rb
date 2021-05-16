class City < ApplicationRecord
  has_many :users
  validates :city_name, presence: true
  validates :zip_code, presence: true
end
