class EmailsController < ApplicationController
  before_action :authenticate_user!

  def update
    raise
    if current_user.update!(profile_params)
      redirect_to edit_profile_path, notice: "Profile updated successfully"
    else
      redirect_back fallback_location: edit_profile_path, alert: "Profile could not be updated"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
