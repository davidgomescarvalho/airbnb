class Property < ApplicationRecord

  validates :name, presence: true
  validates :headline, presence: true
  validates :description, presence: true
  validates :address_1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country_code, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true



  monetize :price_cents, allow_nil: true

  has_many_attached :images

  has_many :reviews, dependent: :destroy

  has_many :property_amenities, dependent: :destroy
  has_many :amenities, through: :property_amenities, source: :amenity, dependent: :destroy

  has_many :wishlists, dependent: :destroy
  has_many :wishlisted_users, through: :wishlists, source: :user, dependent: :destroy

  has_many :reservations, dependent: :destroy
  has_many :reserved_users, through: :reservations, source: :user, dependent: :destroy

  has_many :payments, through: :reservations, dependent: :destroy

  has_rich_text :description

  def self.with_reservations_overlap(checkin_date, checkout_date)
    where.not(id: Reservation.overlapping_reservations(checkin_date, checkout_date).pluck(:property_id))

  end


  def update_average_rating
    average_rating = reviews.average(:final_rating)
    update_column(:average_final_rating, average_rating)
  end

  def average_cleanliness_rating
    reviews.average(:cleanliness_rating)
  end

  def average_accuracy_rating
    reviews.average(:accuracy_rating)
  end

  def average_checkin_rating
    reviews.average(:checkin_rating)
  end

  def average_communication_rating
    reviews.average(:communication_rating)
  end

  def average_location_rating
    reviews.average(:location_rating)
  end

  def average_value_rating
    reviews.average(:value_rating)
  end

  def wishlisted_by?(user = nil)
    return if user.nil?

    wishlisted_users.include?(user)
  end

  def available_dates
    next_reservation = reservations.upcoming_reservations.first
    current_reservation = reservations.current_reservations.first


    if current_reservation.nil? && next_reservation.nil?
      # 1. If there are no reservations, the property is available
      Date.tomorrow.strftime('%e %b')..(Date.tomorrow + 30.days).strftime('%e %b')
    elsif current_reservation.nil?
      # 2. If there are no current reservations, the property is available
      Date.tomorrow.strftime('%e %b')..next_reservation.checkin_date.strftime('%e %b')
    elsif next_reservation.nil?
      # 3. If there are no upcoming reservations, the property is available
      current_reservation.checkout_date.strftime('%e %b')..(Date.tomorrow + 30.days).strftime('%e %b')
    else
      # 4. If there are both current and upcoming reservations, the property is available
      current_reservation.checkout_date.strftime('%e %b')..next_reservation.checkin_date.strftime('%e %b')
    end
  end

end
