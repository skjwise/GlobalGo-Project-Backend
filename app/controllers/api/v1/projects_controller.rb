require 'stripe'
# Stripe.api_key = ENV["STRIPE_API_KEY"]
Stripe.api_key='sk_test_hdQvEcCMfpprldgxb30Pf1UK00USNntLUk'

class Api::V1::ProjectsController < ApplicationController
    def index
        projects = Project.all
        render json: projects
    end

    def charge
        token = params[:token]
        charge = Stripe::Charge.create(
            {
                amount: params[:amount],
                currency: 'gbp',
                description: 'donation',
                receipt_email: 'test@email.com',
                source: token
            }
        )
    end
    
    # def delete_all
    # #Delete all projects, user_starred_projects and donation options
    # Project.delete_all
    # ProjectDonationOption.delete_all
    # UserStarredProject.delete_all
    # render json: { message: 'Deleted all projects, donation options, and starred projects' }, status: :accepted
    # end

end
