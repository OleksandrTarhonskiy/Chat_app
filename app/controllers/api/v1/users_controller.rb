class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :email_confirmation]

  expose :user, -> { User.find_by_token(params[:user]) }

  def create
    user = User.new(user_params)

    if user.password === user.password_confirmation
      email_exists = User.find_by(email: user.email)
      if !email_exists

          user.token = SecureRandom.hex(15)
          if user.save
            origin = request.headers['origin']
            UserMailer.registration_confirmation(user, origin).deliver
            render_api({ message: 'You have successfully signed up. Confirm your email' }, 200)
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

  def email_confirmation
    return render_api({ message: 'Email is already confirmed' }, 200) if user && user.confirmed
    return render_api({ message: 'You have confirmed your email' }, 200) if user && user.update_column(:confirmed, true)
    render_api(404)
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end
end
