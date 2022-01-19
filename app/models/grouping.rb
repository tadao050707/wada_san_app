class Grouping < ApplicationRecord
  belongs_to :user
  belongs_to :team
  
  def Grouping.team_assign?(user)
    Grouping.find_by(user_id: user)
  end
end
