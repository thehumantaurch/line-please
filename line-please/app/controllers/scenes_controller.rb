class ScenesController < ApplicationController

  def index
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> master
    @scenes = Scene.where(script_id: params[:script_id])
  end

  def new
    @scene = Scene.new
<<<<<<< HEAD
>>>>>>> master
=======
=======
>>>>>>> e34be8bcb4f04f4d91037045d2d44be8d536374e
>>>>>>> master
  end

  def create
  end

  def update
  end

  def destroy
  end

end
