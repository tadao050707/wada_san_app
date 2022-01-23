class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :user
  has_many :sale_details
end
