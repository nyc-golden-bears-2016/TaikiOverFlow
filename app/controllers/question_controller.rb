get '/' do
  @questions = Question.all

  erb :'/questions/index'
end

get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  new_question = Question.create(params[:question])

  if new_question.save
    redirect '/'
  else
    "error"
  end
end

get '/questions/:id' do

  @question = Question.find(params[:id])

  session[:question_id] = params[:id]

  erb :'questions/show'
end

