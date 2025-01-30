module Owner
  class PropertiesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_property, only: [:edit, :update]

    def index
      @properties = current_user.properties
    end

    def update

    end

    private

    def set_property
      @property = current_user.properties.find(params[:id])
    end
  end
end
