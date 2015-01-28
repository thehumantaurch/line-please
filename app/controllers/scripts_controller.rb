class ScriptsController < ApplicationController

  def index
    @scripts = Script.all
  end

  def show
  end

  def new
    @script = Script.new
  end

  def create
    @script = Script.new(script_params)
    @script.script_contents = set_text(@script.filepath.current_path)
    set_lines(@script.script_contents)

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
    params.require(:script).permit(:title, :author, :filepath)
  end

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
