class EmailsController < ApplicationController
  before_action :authenticate_user!

  def update
    if current_user.update!(profile_params)
      redirect_to edit_profile_path, notice: "Email updated successfully"
    else
      redirect_back fallback_location: edit_profile_path, alert: "Email could not be updated"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
