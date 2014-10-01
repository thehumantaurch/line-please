before '/lines/*' do
  if session[:id]
  else
    redirect '/sign_in'
  end
end