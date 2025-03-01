class ReviewsController < ApplicationController
  before_action :set_reservation, only: [:new, :create]

  def create
    data_params = review_params.merge(
      property_id: @reservation.property_id,
      reservation_id: @reservation.id
    )

    @review = current_user.reviews.new(data_params)

    if @review.save
      redirect_to root_path, notice: "Review created successfully"
    else
      redirect_back fallback_location: root_path, alert: "Review could not be created"
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:reservation_id])
  end

  def review_params
    params.permit(
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
