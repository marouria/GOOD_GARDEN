class KitsController < ApplicationController
  def show
    @kit = Kit.find(params[:id])
    @plants = KitPlant.where(kit_id: params[:id])
  end

  def new
    @kit = Kit.new
    @plants = Plant.where(season: params[:season], user_level: params[:user_level])
    @slots = params[:slot]
  end

  def create
    session[:plants] = params[:plant]
    @kit = Kit.new
    @kit.user_id = current_user.id
    @kit.save!
    @plants = params[:plant]
    @plants.each do |plant|
      @kitplant = KitPlant.new
      @kitplant.kit_id = @kit.id
      @kitplant.plant_id = plant[0]
      @kitplant.save
    end
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

  def params_plant
    params.require(:kitplant).permit(:plant_id, :user_id)
  end
end
