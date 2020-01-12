class Api::V1::OrganizationsController < ApplicationController

    def index
        organizations = Organization.all
        render json: organizations
    end
    
end
