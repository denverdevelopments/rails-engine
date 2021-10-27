class Item < ApplicationRecord
  belongs_to :merchant

  validates :description, presence: true
  validates :name, presence: true, uniqueness: true
  validates :unit_price, presence: true, numericality: true
end
