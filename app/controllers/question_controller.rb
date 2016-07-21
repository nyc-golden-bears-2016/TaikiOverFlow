get '/' do
  @questions = Question.all

  erb :'/questions/index'
end

get '/questions/new' do

  if logged_in?
    erb :'/questions/new'
  else
    @error = ["You Must Be Logged In To Post A Question"]
    erb :'login/error'
  end

end

post '/questions' do
  new_question = Question.create(params[:question].merge(user_id: current_user))

  if new_question.save
    redirect '/'
  else
    @error = ["Not all fields added"]
    erb :'login/error'
  end
end

get '/questions/:id' do
  @answer = Answer.where(question_id: params[:id])
  @question = Question.find(params[:id])
  session[:question_id] = params[:id]
  session[:answer_id] = @answer.id

    erb :'questions/show'

end

get '/questions' do
  redirect '/'
end
