class Api::V1::ProjectsController < ApplicationController
    def index
        projects = Project.all
        render json: projects
    end
    
    def find_last_project
    max_id = Project.where(status: "active").maximum('gg_project_id')
    render json: max_id
    end
    
    def delete_all
    #Delete all projects, user_starred_projects and donation options
    Project.delete_all
    ProjectDonationOption.delete_all
    UserStarredProject.delete_all
    render json: { message: 'Deleted all projects, donation options, and starred projects' }, status: :accepted
    end
    
    def find_options
    project_id = params[:project_id]
    options_arr = []
    project = Project.find(project_id)
    project.donation_amounts.length.times do |i|
        options_arr.push({"amount": project.donation_amounts[i], "description": project.donation_descriptions[i]})
    end
    # donationOptions = ProjectDonationOption.where(project_id: project_id)
    render json: options_arr
    end
    
    def fetch
    #Need to pass in param of nextID into queryActiveProjects
    projects = []
    json = Project.queryActiveProjects(params)
    NormalizeCountry.to = :alpha3

    # Project.delete_all
    # Organization.delete_all
    json.first[1]["project"].each do |project|
        if(project["organization"] &&
                project["organization"]["themes"] &&
                project["organization"]["countries"])

        project = Project.find_or_create_by(
            # country: project["country"],
            funding: project["funding"],
            goal: project["goal"],
            image_url: project["imageLink"],
            latitude: project["latitude"],
            longitude: project["longitude"],
            long_term_impact: project["longTermImpact"],
            activities: project["activities"],
            need: project["need"],
            gg_organization_id: project["organization"]["id"],
            gg_project_id: project["id"],
            project_link: project["projectLink"],
            status: project["status"],
            summary: project["summary"],
            theme_str_id: project["themeName"],
            title: project["title"]
        )

        if (!Organization.find_by(Gg_organization_id: project["organization"]["id"]))
            #find or create organization here
            organization = Organization.create(
            Gg_organization_id: project["organization"]["id"],
            city: project["organization"]["city"],
            country: project["organization"]["country"],
            mission: project["organization"]["mission"],
            name: project["organization"]["name"],
            url: project["organization"]["url"]
            )
            project.organization = organization
            organization.save
        else
            organization = Organization.find_by(Gg_organization_id: project["organization"]["id"])
            project.organization = organization
        end
        theme = Theme.find_or_create_by(name: project["themeName"])
        theme.save
        project.theme = theme
        country = Country.find_by(name: project["country"])
        country.save
        project.country = country
        project.save
        projects << project

        # if project["donationOptions"]
        #     project["donationOptions"]["donationOption"].each do |option|
            #   ProjectDonationOption.find_or_create_by(
            #     project_id: project.id,
            #     amount: option["amount"],
            #     description: option["description"]
            # )
        #     end
        # end
        end
    end
    render json: {"has_next": json["projects"]["hasNext"], "nextProjectId": json["projects"]["nextProjectId"], "projects": projects}
    end
end
