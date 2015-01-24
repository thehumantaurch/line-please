class ScriptsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @script = Scripts.new
  end

  def create
    @script = Scripts.new(script_params)
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
