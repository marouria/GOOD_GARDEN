class KitsController < ApplicationController
  def new
    @kit = Kit.new
  end

  def create
    @kit = Kit.new(params_kit)
    if @kit.save
      redirect_to :home
    else
      render :new
    end
  end
end
