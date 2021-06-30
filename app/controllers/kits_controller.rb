class KitsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:new]
  def show
    @kit = Kit.find(params[:id])
    @plants = KitPlant.where(kit_id: params[:id])
    @tool_kit = Material.find_by(name:"Lot de 3 outils")
    @gloves = Material.find_by(name:"Gants de jardinage tendances")
    @soil = Material.find_by(name:"Terreau 5kg")
  end

  def new
    @kit = Kit.new
    @plants = Plant.where(season: params[:season], user_level: params[:user_level])
    @slots = params[:slot]
    if @plants.last.nil? || @slots.nil?
      flash[:notice] = "Merci de sélectionner tous les champs"
      redirect_to preferences_path
    end
  end

  def create
    @kit = Kit.new
    @kit.price = 0
    @kit.user_id = current_user.id
    @kit.save!
    @plants = params[:plant]
    if @plants.nil?
      flash[:notice] = "Merci de glisser/déposer au moins une plante"
      redirect_back(fallback_location: root_path)
    else
      @plants.each do |plant|
        @kitplant = KitPlant.new
        @kit.price += Plant.find(plant).first.price
        @kit.save
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
  end

  def add_toolkit
    @toolkit = Material.find_by(name: "Lot de 3 outils")
    # @gloves = Material.find_by(name: "Gants de jardinage tendances")
    # @soil = Material.find_by(name: "Terreau 5kg")
    @kit = Kit.find(params[:kit_id])
    @kitmaterial = KitMaterial.new
    @kitmaterial.kit_id = @kit.id
    @kitmaterial.material_id = @toolkit.id
    @kitmaterial.save!

    redirect_to kit_path(@kit)
  end

   def add_gloves
    @gloves = Material.find_by(name: "Gants de jardinage tendances")
    @kit = Kit.find(params[:kit_id])
    @kitmaterial = KitMaterial.new
    @kitmaterial.kit_id = @kit.id
    @kitmaterial.material_id = @gloves.id
    @kitmaterial.save!

    redirect_to kit_path(@kit)
   end

   def add_soil
    @soil = Material.find_by(name: "Terreau 5kg")
    @kit = Kit.find(params[:kit_id])
    @kitmaterial = KitMaterial.new
    @kitmaterial.kit_id = @kit.id
    @kitmaterial.material_id = @soil.id
    @kitmaterial.save!

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
