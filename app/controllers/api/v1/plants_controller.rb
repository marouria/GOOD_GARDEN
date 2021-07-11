class Api::V1::PlantsController < Api::V1::BaseController
  before_action :set_plant, only: [ :show ]
  def index
    @plants = policy_scope(Plant)
  end

  def show
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
    authorize @plant  # For Pundit
  end
end
