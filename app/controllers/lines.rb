before '/lines/*' do
  if session[:id]
  else
    redirect '/sign_in'
  end
end

get '/lines/new' do
  erb :new_line
end