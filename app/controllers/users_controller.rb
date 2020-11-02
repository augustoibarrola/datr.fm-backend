class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]

    def index 
        users = User.all
        render json: users
    end

    #REGISTER
    # When a user is signing up, a new user instance is being created in the back end. 
    # A POST request will be made to /users which will be redirected to the user controller create method.
    def create 
        @user = User.create(user_params)
        if @user.valid? 
            token = encode_token( { user_id: @user.id } ) #the payloud inside encode_token() can be more than one key if needed. 
            render json: { user: @user, token: token }
        else 
            render json: { error: "Invalid username or password in user#create" }
        end
    end

    #LOGGING IN  
    # a POST request will be made to /login which will be redirected to the user controller login method.
    def login 
        @user = User.find_by( username: params[:username] )

        if @user && @user.authenticate( params[:password] )
            token = encode_token( { user_id: @user.id } )
            render json: { user: @user, token: token }
        else 
            render json: { error: "Invalid username or password in user#login" }
        end
    end

    def auto_login
        render json: @user 
    end

    private 

    def user_params
        params.require(:user).permit(:name, :username, :email, :description, :password)
    end

end 


    # skip_before_action :authorized, only: [:create]

    # def profile
    #     render json: { user: UserSerializer.new(current_user) }, status: :accepted
    # end

    # def show 
    #     @user = User.find_by(id: params[:id])
    #     render json: @user
    # end

    # def new 

    # end

    # def create 
    #     @user = User.create(user_params)

    #     if @user.valid?
    #         @token = encode_token({ user_id: @user.id })
    #         render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created 
    #     else
    #         render json: { error: 'failed to create user' }, status: :not_acceptable
    #         # if the user doesn't create for some error or other, this is the error message that will show up
    #     end
    # end



    # private 

    # def user_params
    #     params.require(:user).permit(:name, :username, :email, :description, :password)
    # end


