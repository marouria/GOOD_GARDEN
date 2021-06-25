class DashboardsController < ApplicationController
  def index
    # recup les kits du user actuel
    @kits_user = Kit.where(user_id: current_user)
  end
end
