get '/user/show/:id' do
  if logged_in?
  @user= current_user
  @questions = @user.questions

  erb :'users/index'

  end
end
