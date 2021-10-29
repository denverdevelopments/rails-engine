class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  validates :name, presence: true, uniqueness: true

  def self.total_revenue(id)
    joins(invoices: :transactions)
    .where(transactions: {result: "success"})
    .where(invoices: {status: "shipped"})
    .where(merchants: {id: id})
    .select('merchants.*, SUM(invoice_items.unit_price*invoice_items.quantity) AS revenue')
    .group(:id)
    .order(revenue: :desc)
    .first
  end
end
