class Product < ApplicationRecord

  #product properites
  validates :name, :price, :description, presence: true
  has_one_attached :image
end
