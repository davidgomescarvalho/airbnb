class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:edit, :update]


  def update
     @profile.update!(profile_params)
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(
      :name,
      :address_1,
      :address_2,
      :city,
      :state,
      :country
    )
  end

end
