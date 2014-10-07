before '/scenes/*' do
  if session[:id]
  else
    redirect '/sign_in'
  end
end

get '/scenes/new' do
  erb :new_scene
end

get '/scenes/:id' do
  @script = Script.find_or_create_by(title: params[:title], author: params[:author])
  @scene = Scene.create(script_id: @script.id)
  @characters = Character.all
  erb :new_line
end

post '/scene/:id/lines' do
    @script = Script.find(params[:id])
    @scene = Scene.find_by(script_id: @script.id)
    # @character = Character.find_or_create_by(name: params[:character])
    # @partner = Character.find_or_create_by(name: params[:partner])
    # p @scharacter
    # p @partner
    # @scene_character = CharacterScene.find_or_create_by(scene_id: @scene.id, character_id: @character.id)
    # @scene_partner = CharacterScene.find_or_create_by(scene_id: @scene.id, character_id: @partner.id)
    # @cue_line = Line.create(character_scene_id: @scene_partner.id, text: params[:cue])
    # @character_line = Line.create(character_scene_id: @scene_character.id, text: params[:line])
    redirect "/users/#{session[:id]}"
end

post '/scenes' do
  @script = Script.find_or_create_by(title: params[:title], author: params[:author])
  @scene = Scene.create(script_id: @script.id)
  redirect "/scenes/#{@scene.id}"
end

