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
    @error = ["Not All Information Supplied For Registration"]
    erb :'login/error'
  end
end

get '/login' do

  erb :'login/login'

end

post '/login' do
  user = User.find_by(email: params[:user][:email])
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
    redirect "/logged_in/#{session[:user_id]}"
    else
      @error = ["Incorrect User Name or Password"]
      erb :'login/error'
    end
end



delete '/logout' do
  session.clear
  redirect "/"
end

