class TransactionsController < ApplicationController
  def create
    record = Record.find_by!(slug: params[:slug])
    token = params[:stripeToken]
    
    begin
      charge = Stripe::Charge.create(
        amount: record.price,
        currency: "usd", 
        card: token, 
        descrtiption: current_user.email)
      @sale = record.sales.create!(
        buyer_email: current_user.email)
      redirect_to pickup_url(guid: @sale.guid)
    rescue Stripe::CardError => each e
      @error = e
      redirect_to record_path(record), notice: @error
  end

  def pickup
    @sale = Sale.find_by(guid: params[:guid])
    @record = @sale.record
  end
end