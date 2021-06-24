class PlantsController < ApplicationController
  def index
    @plants = Plant.all
    # @plants = Plant.where(season: params[:season], user_level: params[:user_level])
  end
end
