get '/login' do
  erb :'login/login'
end

get '/logged_in/:id' do
  @user = current_user
  erb :'login/logged_in'
end


get '/register' do

  erb :'login/register'
end


post '/register' do
  @new_user = User.new(params[:user])
  @entered_password = params[:user][:password]
  @new_user.password = @entered_password

  if @new_user.save
    session[:user_id] = @new_user.id
    redirect "/logged_in/#{session[:user_id]}"
  else
    redirect "/register"
  end
end



post '/login' do
  user = User.find_by(email: params[:user][:email])
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
    redirect "/logged_in/#{session[:user_id]}"
    else
      erb :'login/login'
    end
end



delete '/logout' do
  session.clear
  redirect "/"
end
