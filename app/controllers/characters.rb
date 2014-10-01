before '/characters/*' do
  if session[:id]
  else
    redirect '/sign_in'
  end
end

get '/characters/:id' do
  @charcter = Character.find(params[:id])
  @scenes = SceneCharacter.where(character_id: params[:id])

  erb :character_scenes
end

# post '/characters' do
#   @character = Character.create
#   redirect "/characters/#{params[:id]}"
# end

# put '/characters' do
#   @character = Character.update
#   redirect "/characters/#{params[:id]}"
# end

# delete '/characters' do
#   @charcter = Character.find(params[:id])
    # @character.destroy
#   redirect "/characters/"
# end