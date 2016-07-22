get '/user/show/:id' do
  if logged_in?
  @questions = User.find(params[:id]).questions

  erb :'users/index'

  end
end
