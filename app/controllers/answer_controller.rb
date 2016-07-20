post "/answers" do
  question_id = session[:question_id]

  @answer  = Answer.new(body: params[:answer], question_id: question_id, user_id: session[:user_id])

  if @answer.save
    redirect "/questions/#{session[:question_id]}"
  else
    error
  end

end
