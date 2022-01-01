class Company < ApplicationRecord
  has_many :groupings
  has_many :users  
end
