class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def edit
    @profile = current_user.profile
  end
end
