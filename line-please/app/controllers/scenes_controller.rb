class ScenesController < ApplicationController

  def index
    @scenes = Scene.where(script_id: params[:script_id])
  end

  def new
    @scene = Scene.new
  end

  def create
  end

  def update
  end

  def destroy
  end

end
