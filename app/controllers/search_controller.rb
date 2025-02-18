class SearchController < ApplicationController
  def index
    if are_all_params_empty?
      redirect_to root_path
      return
    end
  end

  private

  def are_all_params_empty?
    !search_params[:country_code].present? && !search_params[:checkin_date].present? && !search_params[:checkout_date].present?
  end

  def search_params
    params.permit(:country_code, :checkin_date, :checkout_date)
  end

end
