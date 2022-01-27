class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :user
  has_many :sale_details, dependent: :destroy
  accepts_nested_attributes_for :sale_details, allow_destroy: true
end
