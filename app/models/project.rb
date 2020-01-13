class Project < ApplicationRecord
    belongs_to :organization, optional: true
    belongs_to :theme, optional: true
    belongs_to :country, optional: true
    has_many :user_starred_projects
    has_many :users, through: :user_starred_projects
    validates :title, presence: true
    validates :image_url, presence: true
    validates :project_link, presence: true
    validates :theme_str_id, presence: true

  
end
