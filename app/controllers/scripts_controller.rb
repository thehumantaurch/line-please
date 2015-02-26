class ScriptsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @scripts = if params[:keywords]
                 Script.where('title ilike ?',"%#{params[:keywords]}%")
               else
                 []
               end
  end

  def show
    @script = Script.find(params[:id])
  end

  def create
    @script = Script.new(params.require(:script).permit(:title,:author))
    @script.save
    render 'show', status: 201
  end

  def update
    script = Script.find(params[:id])
    script.update_attributes(params.require(:script).permit(:title,:author))
    head :no_content
  end

  def destroy
    script = Script.find(params[:id])
    script.destroy
    head :no_content
  end


  private

  def set_text(path)
    pages = []
    PDF::Reader.open(path) do |reader|
        reader.pages.each do |page|
          pages << page.text
        end
      end
    pages.join(" ")
  end

  def set_lines(script)
    lines = script.split(/\./)
    lines.each do |text|
      Line.create(text: text)
    end
  end

end
