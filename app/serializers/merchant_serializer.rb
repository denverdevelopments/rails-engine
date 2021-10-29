class MerchantSerializer
  include JSONAPI::Serializer
  attributes :name  #:id

  # has_many :items
  # has_many :invoices
end
