class BookingsController < ApplicationController
  def new
    @property = Property.find(params[:property_id])
    @checkin_date = params[:checkin_date]
    @checkout_date = params[:checkout_date]

    # Number of nights
    @total_nights = number_of_nights

    # Base Fare
    @base_fare = @property.price
    # Service Fee
    # Total Price
  end

  private

  def number_of_nights
    checkin_date = Date.parse(params[:checkin_date])
    checkout_date = Date.parse(params[:checkout_date])
    return (checkout_date - checkin_date).to_i
  end

  def booking_params
    params.permit(:property_id, :checkin_date, :checkout_date)
  end
end
