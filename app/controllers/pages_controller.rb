class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :preferences_form]

  def home
  end

  def preferences_form
    @plant = Plant.new
  end

  def submit_preferences_form
  end
end
