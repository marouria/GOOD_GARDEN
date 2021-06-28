class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @plants = Plant.all
    #@plants = Plant.where(season: params[:season], user_level: params[:user_level])
  end
end
