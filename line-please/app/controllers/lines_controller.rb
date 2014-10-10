class LinesController < ApplicationController

  def index
    @scene = Scene.third
    @lines = @scene.lines
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def line_params
    params.require(:line).permit([:words])
  end

  def load_line
    Line.find(params[:id])
  end

end
