class User < ApplicationRecord
    has_many :user_starred_projects
    has_many :projects, through: :user_starred_projects
    has_secure_password
    # validates :username, uniqueness: { case_sensitive: false }
  
end
