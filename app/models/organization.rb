class Organization < ApplicationRecord
    has_many :projects
    has_many :themes, through: :projects
    has_many :countries, through: :projects

    def self.queryAllOrganizations
        url = "https://api.globalgiving.org/api/public/orgservice/all/organizations/active?api_key=81e83abd-34c8-4ce8-8282-bce16c0fc71c"
    end
  
end
