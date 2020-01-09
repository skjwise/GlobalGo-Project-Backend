class OrganizationSerializer < ActiveModel::Serializer
  # with joins attributes :id, :name, :mission, :url, :countries, :projects
  attributes :id, :name, :mission, :url
end
