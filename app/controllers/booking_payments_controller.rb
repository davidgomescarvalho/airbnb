class BookingPaymentsController < ApplicationController
  def create
    raise
  end

  private

  def booking_payments_params
    params.permit(
      :stripeToken,
      :property_id,
      :user_id,
      :checkin_date,
      :checkout_date,
      :base_fare,
      :service_fee,
      :total_fare
     )
  end

  def property
    @property = Property.find(params[:property_id])
  end
  
end
