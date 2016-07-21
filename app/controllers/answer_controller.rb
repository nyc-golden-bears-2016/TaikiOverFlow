post "/answer" do

  answer  = Answer.new(params["answer"].merge(user_id: current_user, question_id: current_question))
  # add helper method to find current_question

  if answer.save
    redirect "/questions/#{current_question.id}"
  else
    error
  end

end

get '/answer/:id' do


    @question = Question.find(params[:id])
    session[:question_id] = params[:id]
    @answer = Answer.find(params[:id])
    session[:answer_id] = params[:id]

    erb :'answers/show'

end

