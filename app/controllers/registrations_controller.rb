class RegistrationsController < ApplicationController
  def create
    user = Actors::Customer::UseCases.register_for_an_account(user_params)
    render json: payload(user)
  end

  private
  def payload(user)
    {
      token: Clark::Support::JwtToken.encode({user_id: user.id})
    }
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
