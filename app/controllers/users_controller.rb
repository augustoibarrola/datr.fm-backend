class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

    # localhost:3000/users =>> shows all of users in the database
    def index 
        users = User.all
        render json: users
    end

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def show 
        @user = User.find_by(id: params[:id])
        render json: @user
    end

    def new 

    end

    def create 
        @user = User.create(user_params)

        if @user.valid?
            @token = encode_token({ user_id: @user.id })
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created 
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
            # if the user doesn't create for some error or other, this is the error message that will show up
        end
    end

    def total_likes_given
        @likes_given = Heart.where(:liker_id => current_user.id)

        render json: { likes_given: @likes_given }
    end

    def total_unique_likers
        @unique_likers = current_user.unique_likers

        render json: { unique_likers: @unique_likers }
    end

    private 

    def user_params
        params.require(:user).permit(:name, :username, :email, :description, :password)
    end

end 


   

