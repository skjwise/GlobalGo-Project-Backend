class Api::V1::UsersController < ApplicationController

    def index
        render json: {
            user: UserSerializer.all
        }
    end

    # def profile
    #     render json: { user: UserSerializer.new(current_user) }, status: :accepted
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
        params.permit(:id, :username, :password, :email)
    end

    def user_login_params
        params.require(:user).permit(:username, :password)
    end
   
end
