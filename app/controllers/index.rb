enable :sessions

get '/sign_in' do
  if session[:errors]
    @errors = session[:errors]
    session[:errors] = nil
  end
  erb :sign_in
end

post '/sign_in' do
  user = User.find_by(email: params[:email])
  if user == nil
    session[:errors] = "Incorrect Credentials"
    redirect '/sign_in'
  end

  valid = user.authenticate(params[:password])

  if valid == false
    session[:errors] = "Incorrect Credentials"
    redirect '/sign_in'
  else
    session[:id] = valid.id
    redirect "/users/#{session[:id]}"
  end

end

get '/sign_out' do
  session.clear
  erb :index
end



get '/sign_up' do
  if session[:errors]
    @errors = session[:errors]
    session[:errors] = nil
  end
  erb :sign_up
end

post '/sign_up' do
 user = User.find_by(email: params[:email])
  if user == nil
    User.create(email: params[:email], password: params[:password])
    redirect '/sign_in'
  else
    session[:errors] = "You already signed up!"
    redirect '/sign_in'
  end
end

get '/' do
  erb :index
end


