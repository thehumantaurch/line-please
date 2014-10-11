class CharactersController < ApplicationController

  def index
    @characters = SceneCharacter.where(character_id: params[:character_id])
  end

  def create
    @character = Character.create(character_params)
    redirect_to
  end

  def update
    load_character
    @character = Character.update(character_params)
    redirect_to
  end

  def destroy
    load_character
    @character.destroy
    redirect_to
  end

  private

  def load_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit([:name])
  end

end
