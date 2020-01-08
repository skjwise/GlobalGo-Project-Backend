class Organization < ApplicationRecord
    has_many :projects
    has_many :themes, through: :projects
    has_many :countries, through: :projects
  
end
