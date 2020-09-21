class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    user = User.create(user_params)
    if user.valid?
      payload = { user_id: user.id }
      token = encode_token(payload, Time.now.to_i + 3600)
      puts token
      render json: { user: user, jwt: token }
    else
      render json: { errors: user.errors.full_messages, user: user }, status: :not_acceptable
    end
  end

  private

  def user_params
    #  params.permit(:username, :email, :password_digest)
    params.require(:newuser).permit(:username, :email, :password, :password_confirmation)
  end
end
