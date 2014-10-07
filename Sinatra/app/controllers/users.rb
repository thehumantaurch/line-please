before '/users/*' do
  if session[:id]
  else
    redirect '/sign_in'
  end

end

get '/users' do
  if session[:id]
    redirect "/users/#{session[:id]}"
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :user_home
end