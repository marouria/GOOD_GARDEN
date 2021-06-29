class PaymentsController < ApplicationController
   def new
    @order = current_user.orders.where(status: 'pending').find(params[:order_id])
    @kit_tool = Kit.find_by(name: "toolkit")
  end
end
