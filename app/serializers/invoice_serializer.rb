class InvoiceSerializer
  include JSONAPI::Serializer
  attributes :id, :status

  belongs_to :merchant
  belongs_to :customer
end
