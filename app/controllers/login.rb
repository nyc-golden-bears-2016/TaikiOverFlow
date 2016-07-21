get '/login' do
  erb :'login/login'
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
    redirect "/"
  else
    @error = ["Not All Information Supplied For Registration"]
    erb :'login/error'
  end
end



post '/login' do
  user = User.find_by(email: params[:user][:email])
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
    redirect "/"
    else
      @error = ["Incorrect User Name or Password"]
      erb :'login/error'
    end
end



get '/logout' do
  session.clear
  redirect "/"
end

