before '/characters/*' do
  if session[:id]
  else
    redirect '/sign_in'
  end
end

get '/characters/:id/scenes/:scene_id' do
  @character = Character.find(params[:id])
  @scene = Scene.find(params[:scene_id])
  erb :start
end

get '/characters/:id' do
  @character = Character.find(params[:id])
  @character_scenes = CharacterScene.where(character_id: @character.id)
  @scenes = []
  @character_scenes.each do |scene|
    @scenes << Scene.find(scene.scene_id)
  end
  p @character
  p @character_scenes
  p @scenes

  erb :character_scenes
end

get '/characters' do
  @characters = Character.all
  erb :characters
end