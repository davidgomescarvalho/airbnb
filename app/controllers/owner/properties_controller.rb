module Owner
  class PropertiesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_property, only: [:edit, :update, :update_amenities, :add_images, :remove_image]

    def index
      @properties = current_user.properties
    end

    def update
      if @property.update!(property_params)
        redirect_to edit_owner_property_path, notice: 'Property was successfully updated.'
      else
        redirect_back fallback_location: edit_owner_property_path, alert: 'Property could not be updated.'
      end
    end

    def update_amenities
      if @property.update!(amenities_params)
        redirect_to edit_owner_property_path, notice: 'Amenities was successfully updated.'
      else
        redirect_back fallback_location: edit_owner_property_path, alert: 'Amenities could not be updated.'
      end
    end

    def remove_image
      image = @property.images.find(params[:image_id])
      if image.destroy!
        redirect_to edit_owner_property_path, notice: 'Image was successfully deleted.'
      else
        redirect_back fallback_location: edit_owner_property_path, alert: 'Image could not be deleted.'
      end
    end

    def add_images
      # TODO: Possibly optimise this part
        @property.images.attach(params[:property][:images])
        redirect_to edit_owner_property_path, notice: 'Property images were successfully uploaded.'
    end

    private

    def set_property
      @property = current_user.properties.find(params[:id])
    end

    def amenities_params
      params.require(:property).permit(:amenity_ids => [])
    end

    def property_params
      params.require(:property).permit(
        :name,
        :price,
        :headline,
        :description,
        :address_1,
        :address_2,
        :city,
        :state,
        :country_code
      )
    end
  end
end
