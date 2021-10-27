class Invoice < ApplicationRecord
  belongs_to :merchant
  belongs_to :customer

  validates :status, presence: true
  enum status: [:packaged, :pending, :shipped]
end
