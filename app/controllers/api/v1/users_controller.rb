class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :index]

  expose :user, -> { User.find_by_token(params[:user]) }

  def index
    render json: current_user
  end

  def create
    user = User.new(user_params)

    if user.password === user.password_confirmation
      email_exists = User.find_by(email: user.email)

      if !email_exists
        user.token = SecureRandom.hex(15)

          if user.save
            render_api({ message: 'You have successfully signed up' }, 200)
          else
            render json: User.create(user_params).errors, status: 404
          end

      else
        render_api({ message: 'Email has already been taken' }, 207)
      end

    else
      render_api({ message: 'Passwords do not match' }, 207)
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end
end
