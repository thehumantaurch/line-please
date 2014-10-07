before '/lines/*' do
  if session[:id]
  else
    redirect '/sign_in'
  end
end

get '/lines/new' do
  @characters = Character.all
  erb :new_line
end