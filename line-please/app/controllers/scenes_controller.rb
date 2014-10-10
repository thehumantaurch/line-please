class ScenesController < ApplicationController

  def index
<<<<<<< HEAD
    @scenes = Scene.where(script_id: params[:script_id])
  end

  def new
    @scene = Scene.new
=======
>>>>>>> e34be8bcb4f04f4d91037045d2d44be8d536374e
  end

  def create
  end

  def update
  end

  def destroy
  end

end
