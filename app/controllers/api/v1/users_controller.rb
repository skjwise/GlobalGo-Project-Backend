class Api::V1::UsersController < ApplicationController

    def index
        render json: {
            user: UserSerializer.all
        }
    end

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end
    
    # def create
    # user = User.new(user_params)
    # cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    # user.password_digest = BCrypt::Password.create(params[:password], cost: cost)
    #     if user.save
    #         token = encode_token(user_id: user.id)
    #         render json: { user:   UserSerializer.new(user), jwt: token }, status: :created
    #     else
    #         render json: {error: 'failed to create user. please try another username' }, status: :not_acceptable
    #     end
    # end
    
    # def check_star
    # starred = false
    # project_id = params[:project_id].to_i
    # user = User.find(params[:user_id])
    # user_projects = @user.projects

    # if user_projects.length > 0
    #     user_projects.each do |project|
    #         if project[:id] == project_id
    #         starred = true
    #         break
    #         end
    #     end
    #     else
    #     UserStarredProject.all.each do |star|
    #     if project_id == star.project_id && user.id == star.user_id
    #         starred = true
    #         break
    #     end
    #     end
    # end

    # if starred
    #     render json: {status: 'Project is starred.'}
    # else
    #     render json: {status: 'Project is not starred.'}
    # end
    # end
    
    def update
    user = User.find(user_params[:id])
        if user.update(user_params)
            render json: user
        else
            render json: {error: 'failed to update user' }, status: :not_acceptable
        end
    end


    def create
        user = User.new(user_params)
        if user.save
            render json: { user: UserSerializer.new(user), token: issue_token({user_id: user.id})}
        else
            render json: { errors: user.errors.full_messages}, status: :not_acceptable
        end
    end

    def login
        # byebug
        user = User.find_by(username: user_login_params[:username])
        if user && user.authenticate(user_login_params[:password])
            render json: { user: UserSerializer.new(user), token: issue_token(user_id: user.id) }, status: :accepted
        else
            render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
    end

    def validate_user
        if logged_in?
            render json: {user: UserSerializer.new(@current_user), token: issue_token(user_id: @current_user.id)}, status: :accepted
        else
            render json: {error: 'invalid token'}, status: :unauthorized
        end
    end
    
    private

    # def user_params
    # params.permit(:id, :username, :password_digest, :first_name, :last_name,
    #     :email, :default_country, :theme1, :theme2, :theme3)
    # end
    def user_params
        params.permit(:id, :username, :password, :first_name, :last_name, :email)
    end

    def user_login_params
        params.require(:user).permit(:username, :password)
    end
   
end
