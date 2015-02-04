class TransactionsController < ApplicationController
  def create
    record = Record.find_by!(slug: params[:slug])
    sale = record.sales.create(
      amount: record.price,
      buyer_email: current_user.email,
      seller_email: record.user.email,
      stripe_token: params[:stripeToken])
    sale.process!
    if sale.finished?
      redirect_to pickup_url(guid: sale.guid), notice: "Transaction Successful"
    else
      redirect_to record_path(record), notice: "Something went wrong"
    end
  end

  def pickup
    @sale = Sale.find_by!(guid: params[:guid])
    @record = @sale.record
  end
end