class OrdersController < ApplicationController
  def create
    @kit = Kit.find(params[:kit_id])
    @tool_kit = Material.find(@kit.material_id)
    @order = Order.create!(kit: @kit, amount: @kit.price, status:'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: @kit.id,
      amount: @order.amount_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: order_url(@order),
    cancel_url: order_url(@order)
  )

    @order.update(checkout_session_id: session.id)
    redirect_to new_kit_order_payment_path(@kit, @order)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
