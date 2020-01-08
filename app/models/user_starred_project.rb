class UserStarredProject < ApplicationRecord
    belongs_to :project
    belongs_to :user
  
end
