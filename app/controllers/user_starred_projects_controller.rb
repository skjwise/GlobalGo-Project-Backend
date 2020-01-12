class UserStarredProjectsController < ApplicationController
    def index
        allStars = UserStarredProject.all
        render json: allStars
    end
    
    def create
    userStar = UserStarredProject.new(user_star_params)
    number_stars = UserStarredProject.where(user_id: userStar.user_id).length
    userStar.order_number = number_stars + 1
    if userStar.save
        render json: userStar, status: :created
    else
        render json: {error: 'failed to create user star' }, status: :not_acceptable
    end
    end
    
    def remove_project
    user_id = params[:user_id]
    project_id = params[:project_id]

    user_project = UserStarredProject.find_by(user_id: user_id, project_id: project_id)
    higher_projects = UserStarredProject.where("order_number > ? AND user_id = ?", user_project.order_number, user_id)

    if user_project.delete
        #Find all the projects with an order_number > @user_project.order_number and decrement them
        higher_projects.map do |project|
        project.order_number -= 1
        project.save
        end
        render json: {message: 'Removed Project' }, status: :accepted
    else
        render json: {error: 'Could Not Remove Project' }, status: :not_acceptable
    end
    end
    
    def get_projects
    user = User.find(params["user_id"])
    user_projects = UserStarredProject.where(user_id: user.id)
    user_projects = user_projects.sort_by{|project| -project.order_number }
    p user_projects
    user_projects = user_projects.map do |project|
        Project.find(project.project_id)
    end
    render json: user_projects
    end
    
    def update_star_orders
    user_id = params[:user_id]
    order = 1
    project_array = params[:project_array]
    project_array.each do |id|
        user_star = UserStarredProject.find_by(user_id: user_id, project_id: id)
        user_star.order_number = order
        order += 1
        user_star.save
    end
    render json: {message: 'Updated Order' }, status: :accepted
    end
    
    private
    
    def user_star_params
    params.permit(:project_id, :user_id)
    end
end
