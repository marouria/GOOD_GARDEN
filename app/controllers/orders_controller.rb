class OrdersController < ApplicationController
  def create
    @kit = Kit.find(params[:kit_id])
    @order = Order.create!(kit: @kit, amount: @kit.price, status:'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: @kit.id,
      amount: @kit.price_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: order_path(@order),
    cancel_url: order_path(@order)
  )

    @order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(@order)
  end
end
