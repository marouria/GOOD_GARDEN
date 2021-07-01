class OrdersController < ApplicationController
  def create
    @kit = Kit.find(params[:kit_id])
    if @kit.materials.present?
      @kit.materials.each do |material|
        @kit.price += material.price
      end
    end
    @order = Order.create!(kit: @kit, amount: @kit.price, status:'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: @kit.id,
      amount: @order.amount_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: dashboard_url,
    cancel_url: dashboard_url
  )

    @order.update(checkout_session_id: session.id)
    redirect_to new_kit_order_payment_path(@kit, @order)
  end
end
