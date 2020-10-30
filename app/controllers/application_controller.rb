class ApplicationController < ActionController::API

    # before_action :authorized
    # uncommenting the above will make it so that access to the API is not granted
    # unless user has successfully logged into db
    
    def encode_token(payload)
        JWT.encode(payload, 's3cret')

    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 's3cret', true)
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user 
        if decoded_token 
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in? 
        !!current_user
    end

    def authorized 
        render json: { message: 'Please Log In' }, status: :unauthorized unless logged_in?
    end
end
