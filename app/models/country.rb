class Country < ApplicationRecord
    has_many :projects
    has_many :organizations, through: :projects
    has_many :themes, through: :projects

#   def self.queryAllCountries
#     url = "https://api.globalgiving.org/api/public/projectservice/regions/countries/projects/active/count?api_key=4be97db5-e712-49b1-bae9-12c85422ce7a"
#     json = JSON.parse(RestClient.get url, {content_type: :json, accept: :json})
#   end

#   def self.create_all
#     json = self.queryAllCountries
#     NormalizeCountry.to = :alpha3
#     json["regions"]["region"].each do |region|
#       region["countries"]["country"].each do |country|
#         @country = Country.find_or_create_by(name: country["name"], iso3166CountryCode: NormalizeCountry.convert(country["iso3166CountryCode"]))
#         @country.save
#       end
#     end
#   end
end
