class KitsController < ApplicationController
  def show
    @kit = Kit.find(params[:id])
    @plants = KitPlant.where(kit_id: params[:id])
    @total_price = 0
  end

  def new
    @kit = Kit.new
  end

  def create
    @kit = Kit.new(params_kit)
    if @kit.save
      redirect_to :home
    else
      render :new
    end
  end
end
