class KitsController < ApplicationController
  def show
    @kit = Kit.find(params[:id])
    @plants = KitPlant.where(kit_id: params[:id])
    @total_price = 0
  end

  def new
    @kit = Kit.new
    @plants = Plant.where(season: params[:season], user_level: params[:user_level])
  end

  def create
    @kit = Kit.new(params_kit)
    if @kit.save

      redirect_to kit_path(@kit)
    else
      render :new
    end
  end

  private

  def params_kit
    params.require(:kit).permit(:slot, :img_url, :kit_price, :name, :tools, :user_id)
  end
end


