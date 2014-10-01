before '/users/*' do
  if session[:id]
  else
    redirect '/sign_in'
  end

end

get '/users/:id' do
  @user = User.find(params[:id])
  @characters = Character.all
  erb :user
end