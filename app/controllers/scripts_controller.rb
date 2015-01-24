class ScriptsController < ApplicationController

  def index
    @scripts = Scripts.all
  end

  def show
  end

  def new
    @script = Scripts.new
  end

  def create
    @script = Scripts.new(script_params)

    if @script.save
      redirect_to scripts_path
    else
      redirect_to new_script_path
    end

  end

  def edit
  end

  def post
  end

  def delete
  end

  private

  def script_params
    params.require(:script).permit(:title, :author, :pdf_file)
  end

end
