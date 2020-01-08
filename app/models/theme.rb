class Theme < ApplicationRecord
    has_many :projects
    has_many :organizations, through: :projects
    has_many :countries, through: :projects
  
end
