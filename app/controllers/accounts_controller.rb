class AccountsController < ApplicationController
  before_action :authenticate!

  def create
    if Actors::Account::UseCases.open_bank_account(account_params)
      return render status: :created
    end
    head :unprocessable_entity
  end

  def deposit
    account = Account.find(params[:id])
    return head :not_found unless account

    if Actors::Account::UseCases.deposit_for_an_account(account, amount)
      return render json: {deposited: true}
    end

    head :unprocessable_entity
  end

  def withdraw
    account = Account.find(params[:id])
    return head :not_found unless account

    if Actors::Account::UseCases.withdraw_from_an_account(account, amount)
      return render json: {withdrawn: true}
    end

    head :unprocessable_entity
  end

  def transfer
    account = Account.find(params[:id])
    return head :not_found unless account

    recipient_param = params.permit(:recipient_id)
    recipient = Account.find(recipient_param[:recipient_id])
    return head :not_found unless recipient

    if Actors::Account::UseCases.transfer_between_accounts(account, recipient, amount)
      return render json: {transfered: true}
    end

    head :unprocessable_entity
  end

  private
  def account_params
    params.require(:account).permit(:name, :user_id)
  end

  def amount
    param = params.permit(:amount)
    param[:amount].to_f
  end
end
