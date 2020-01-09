class ProjectSerializer < ActiveModel::Serializer
  # with joins attributes :id, :title, :status, :funding, :goal,
  # :project_donation_options, :country, :theme, :organization
  attributes :id, :country, :activities, :theme, :project_link, :organization, 
  :gg_project_id, :gg_organization_id, :latitude, :longitude, :title, :status, 
  :funding, :goal, :long_term_impact, :summary, :image_url, 
  :donation_descriptions, :donation_amounts
end
