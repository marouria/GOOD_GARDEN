class PaymentsController < ApplicationController
   def new
    @order = current_user.orders.where(status: 'pending').find(params[:order_id])
    @kit = Kit.find(params[:kit_id])
  end
end
