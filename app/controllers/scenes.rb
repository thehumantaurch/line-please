before '/scenes/*' do
  if session[:id]
  else
    redirect '/sign_in'
  end
end

