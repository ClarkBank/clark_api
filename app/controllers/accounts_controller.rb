class AccountsController < ApplicationController
  before_action :authenticate!

  def create
    if Actors::Account::UseCases.open_bank_account(account_params)
      return render status: :created
    end
    head :unprocessable_entity
  end

  private
  def account_params
    params.require(:account).permit(:name, :user_id)
  end
end
