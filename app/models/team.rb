class Team < ApplicationRecord
  belongs_to :user
  has_many :groupings, dependent: :destroy
  has_many :grouping_users,through: :groupings, source: :user
end
