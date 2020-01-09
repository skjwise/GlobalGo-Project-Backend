class CountrySerializer < ActiveModel::Serializer
  attributes :id, :iso3166CountryCode, :name
end
