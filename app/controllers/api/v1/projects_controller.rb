require 'stripe'
Stripe.api_key = ENV["STRIPE_API_KEY"]

class Api::V1::ProjectsController < ApplicationController
    def index
        projects = Project.all
        render json: projects
    end

    def charge
        byebug
        token = params[:token]
        charge = Stripe::Charge.create(
            {
                amount: 1,
                currency: 'gbp',
                description: 'donation',
                receipt_email: 'test@email.com',
                source: token
            }
        )
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
    
    

end
