class UsersController < ApplicationController

    def index 
        users = User.all
        render json: users
    end

    def show 
        user = User.find_by(id: params[:id])
        render json: user
    end

    def new 

    end

    def create 
        @user = User.create(user_params)

        if @user.save
            render json: @user
        else
            render json: @user.errors
        end
    end



    private 

    def user_params
        params.require(:user).permit(:name, :username, :email, :description, :password)
    end

end
