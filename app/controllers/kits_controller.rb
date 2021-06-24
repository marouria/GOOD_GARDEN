class KitsController < ApplicationController
  def new
    @kit = Kit.new
  end

  def create
    @kit = Kit.new(params_kit)
    if @kit.save

      redirect_to preferences_path
    else
      render :new
    end
  end

  private

  def params_kit
    params.require(:kit).permit(:slot, :img_url, :kit_price, :name, :tools, :user_id)
  end
end


