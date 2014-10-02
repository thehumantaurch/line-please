before '/characters/*' do
  if session[:id]
  else
    redirect '/sign_in'
  end
end

get '/characters/:id/scenes/:scene_id' do
  @character = Character.find(params[:id])
  @scene = Scene.find(params[:scene_id])
  @target = CharacterScene.find_by(scene_id: @scene.id, character_id: @character.id)
  @other_target = CharacterScene.where(scene_id: @scene.id).where.not(character_id: @character.id).pluck(:id)
  @lines = Line.where(character_scene_id: @target.id)
  @cues = Line.where(character_scene_id: @other_target)
  erb :study
end

get '/characters/:id' do
  @character = Character.find(params[:id])
  @character_scenes = CharacterScene.where(character_id: @character.id)
  @scenes = []
  @character_scenes.each do |scene|
    @scenes << Scene.find(scene.scene_id)
  end
  erb :character_scenes
end

get '/characters' do
  @characters = Character.all
  erb :characters
end