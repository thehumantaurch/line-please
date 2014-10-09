class ScriptsController < ApplicationController

  def index
    @scripts = Script.all
  end

  def new
    @script = Script.new
  end

  def create
    @script = Script.create(script_params)
    redirect_to scripts_path
  end

  def update
  end

  def destroy
  end

  private

  def script_params
    params.require(:script).permit(:title, :author)
  end

end
