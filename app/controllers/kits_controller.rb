class KitsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:new]
  def show
    @kit = Kit.find(params[:id])
    @plants = KitPlant.where(kit_id: params[:id])
    @tool_kit = Material.find_by(name: "Outils de jardinage")
  end

  def new
    @kit = Kit.new
    @plants = Plant.where(season: params[:season], user_level: params[:user_level])
    @slots = params[:slot]
  end

  def create
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
    if @kitplant.save
      redirect_to kit_path(@kit)
    else
      render :new
    end
  end

  def add_tool
    @kit = Kit.find(params[:kit_id])
    @tool_kit = Material.find_by(name: "Outils de jardinage")
    if @kit.material_id.nil?
    @kit.material_id = @tool_kit[:id]
    @kit.save
    else @kit.material_id = nil
      @kit.save
    end
    redirect_to kit_path(@kit)
  end

  private

  def params_kit
    params.require(:kit).permit(:slot, :img_url, :price, :name, :tools, :user_id)
  end

  def params_plant
    params.require(:kitplant).permit(:plant_id, :user_id)
  end

  def params_tool
    params.require(:material).permit(:price)
  end
end
