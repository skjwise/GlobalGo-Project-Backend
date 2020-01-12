class Theme < ApplicationRecord
    has_many :projects
    has_many :organizations, through: :projects
    has_many :countries, through: :projects


    def self.queryAllThemes
    api_key = '81e83abd-34c8-4ce8-8282-bce16c0fc71c'
    url = "https://api.globalgiving.org/api/public/projectservice/themes?api_key=#{api_key}"
    end
    # https://api.globalgiving.org/api/public/projectservice/themes?api_key=81e83abd-34c8-4ce8-8282-bce16c0fc71c


end
