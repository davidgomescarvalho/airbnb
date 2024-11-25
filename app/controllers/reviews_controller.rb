class ReviewsController < ApplicationController

  def new
    @reservation = Reservation.find(params[:reservation_id])
  end

  def create

  end

  private

  def reviews_params
    params.permit(
      :user_id,
      :property_id,
      :reservation_id,
      :content,
      :cleanliness_rating,
      :accuracy_rating,
      :checkin_rating,
      :communication_rating,
      :location_rating,
      :value_rating
    )
  end
end
