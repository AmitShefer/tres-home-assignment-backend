class V1::UserTransactionsController < ApplicationController

  def index
    user_id = @current_user.id
    start_value = params[:start_value]
    end_value = params[:end_value]
    start_date = params[:start_date]
    end_date = params[:end_date]

    cache_key = "user_transactions/#{user_id}/#{start_value}/#{end_value}/#{start_date}/#{end_date}"

    transactions = Rails.cache.fetch(cache_key, expires_in: 30.minutes) do
      UserTransaction.where(user_id: user_id,
                            value: start_value..end_value,
                            date: start_date..end_date)
                     .order(date: :desc)
                     .to_a
    end

    render json: transactions
  end

  def create
    render json: UserTransaction.create(user_id: @current_user.id,
                                        txn_hash: params[:hash],
                                        method: params[:method],
                                        date: params[:date],
                                        from: params[:from],
                                        to: params[:to],
                                        value: params[:value],
                                        fee: params[:fee])
  end

end
