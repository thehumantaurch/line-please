class LinesController < ApplicationController

  def index
    @scene = Scene.third #update with params
    @lines = @scene.lines
  end

  def new
    @line = Line.new
  end

  def create
    @line = Line.create(line_params)
    redirect_to scene_path(params[:scene_id])
  end

  def edit
    load_line
  end

  def update
    @line = Line.update(line_params)
    redirect_to scene_path(params[:scene_id])

  end

  def destroy
    load_line
    @line.destroy
  end

  private

  def line_params
    params.require(:line).permit([:words])
  end

  def load_line
    Line.find(params[:id])
  end

end
