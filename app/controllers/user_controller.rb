get '/user/show/:id' do
  if logged_in?
  @user = User.find(params[:id]).questions

  erb :'users/index'

  end
end
