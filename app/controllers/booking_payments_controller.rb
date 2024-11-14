class BookingPaymentsController < ApplicationController
  def create

    @property = Property.find(booking_payments_params[:property_id])

    stripe_price = Stripe::Price.create({
      currency: 'usd',
      unit_amount: Money.from_amount(BigDecimal(booking_payments_params[:total_amount])).cents,
      product_data: {
        name: @property.name
      }
    })

    stripe_session = Stripe::Checkout::Session.create({
      success_url: 'https://example.com/success',
      line_items: [
        {
          price: stripe_price.id,
          quantity: 1,
        },
      ],
      mode: 'payment',
    })

    raise

    redirect_to stripe_session.url, allow_other_host: true, status: 303
  end

  private

  def booking_payments_params
    params.permit(
      :stripeToken,
      :property_id,
      :user_id,
      :checkin_date,
      :checkout_date,
      :base_fare,
      :service_fee,
      :total_amount
     )
  end

end
