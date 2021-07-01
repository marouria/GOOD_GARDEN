class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    # @plants = Plant.all
    if params[:query].present?
      @plants = Plant.search_by_name_and_description(params[:query])
    else
      @plants = Plant.all
    end
  end

  def show
    @plant = Plant.find(params[:id])
  end

end
