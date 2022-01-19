class Team < ApplicationRecord
  belongs_to :user
  has_many :groupings, dependent: :destroy
end
