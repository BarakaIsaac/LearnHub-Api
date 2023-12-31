class UsersController < ApplicationController
  skip_before_action :authorized, only: [:register, :login]
  skip_before_action :authorize_admin_or_teacher

   def register
      user = User.create(register_user_params)
      if user.valid?
        access_token = encode_token(user_id: user.id)
        refresh_token = encode_token({ user_id: user.id, refresh: true }, 1.week.from_now)
        render json: {
            user: {
              id: user.id,
              username: user.username,
              email: user.email,
            },
            access_token: access_token,
            refresh_token: refresh_token
          }, status: :created
      else
        render json: { error: user.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end
  
    def login
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        access_token = encode_token(user_id: user.id)
        refresh_token = AuthenticationService.encode({ user_id: user.id, refresh: true }, 1.week.from_now)
        render json: {
            user: {
              id: user.id,
              username: user.username,
              email: user.email,
              role: user.role
            },
            access_token: access_token,
            refresh_token: refresh_token
          }, status: :created
      else
        render json: { error: "Invalid email or password" }, status: :unauthorized
      end
    end
  
    private
  
    def user_params
      params.permit(:username, :email, :password, :role)
    end

    def register_user_params
      params.permit(:first_name, :last_name, :username, :email, :password, :role)
    end
end
