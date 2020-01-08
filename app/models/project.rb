# require 'dotenv/load'

class Project < ApplicationRecord
    belongs_to :organization, optional: true
    belongs_to :theme, optional: true
    belongs_to :country, optional: true
    has_many :user_starred_projects
    has_many :users, through: :user_starred_projects
    # validates :title, presence: true
    # validates :image_url, presence: true
    # validates :project_link, presence: true
    # validates :theme_str_id, presence: true

    # def self.queryActiveProjects(params)
    #     api_key = ENV['API_KEY']
    #     if params[:nextProject]
    #       url = "https://api.globalgiving.org/api/public/projectservice/all/projects/active?api_key=#{api_key}&nextProjectId=#{params[:nextProject]}&status=active"
    #     else
    #       url = "https://api.globalgiving.org/api/public/projectservice/all/projects/active?api_key=#{api_key}&status=active"
    #     end
    #     json = JSON.parse(RestClient.get url, {content_type: :json, accept: :json})
    #   end
    
    
    #   def self.fetch(params)
    #     #Add a check to see if Project count < 8000. Added bc of Heroku 10k row limit
    #     if (Project.all.count + Organization.all.count) < 8000
    #       @projects = []
    #       json = self.queryActiveProjects(params)
    #       NormalizeCountry.to = :alpha3
    #       json.first[1]["project"].each do |project|
    #         if(project["organization"] &&
    #                 project["organization"]["themes"] &&
    #                 project["organization"]["countries"])
    
    #           @project = Project.find_or_create_by(
    #             funding: project["funding"],
    #             goal: project["goal"],
    #             image_url: project["imageLink"],
    #             latitude: project["latitude"],
    #             longitude: project["longitude"],
    #             long_term_impact: project["longTermImpact"],
    #             activities: project["activities"],
    #             need: project["need"],
    #             gg_organization_id: project["organization"]["id"],
    #             gg_project_id: project["id"],
    #             project_link: project["projectLink"],
    #             status: project["status"],
    #             summary: project["summary"],
    #             theme_str_id: project["themeName"],
    #             title: project["title"]
    #           )
    
    #           # add donation options to @project
    #           if project["donationOptions"]
    #             project["donationOptions"]["donationOption"].each do |option|
    #               if option["description"] && option["amount"]
    #                 @project.donation_descriptions.push(option["description"])
    #                 @project.donation_amounts.push(option["amount"])
    #               end
    #             end
    #           end
    
    #           if (!Organization.find_by(Gg_organization_id: project["organization"]["id"]))
    #             #find or create organization here
    #             @organization = Organization.create(
    #               Gg_organization_id: project["organization"]["id"],
    #               city: project["organization"]["city"],
    #               country: project["organization"]["country"],
    #               mission: project["organization"]["mission"],
    #               name: project["organization"]["name"],
    #               url: project["organization"]["url"]
    #             )
    #             @project.organization = @organization
    #             @organization.save
    #           else
    #             @organization = Organization.find_by(Gg_organization_id: project["organization"]["id"])
    #             @project.organization = @organization
    #           end
    #           @theme = Theme.find_or_create_by(name: project["themeName"])
    #           @theme.save
    #           @project.theme = @theme
    #           @country = Country.find_by(name: project["country"])
    #           @country.save
    #           @project.country = @country
    #           @project.save
    #           @projects << @project
    #         end
    #       end
    #       # Check to see if there are still more projects in the GlobalGiving API
    #       # If so --> output the next project ID to the console, and fetch the next list of projects from the API using the next projectId
    #       if json["projects"]["hasNext"]
    #         params[:nextProject] = json["projects"]["nextProjectId"]
    #         puts json["projects"]["nextProjectId"]
    #         self.fetch(params)
    #       end
    #     end
    #   end
  
end
