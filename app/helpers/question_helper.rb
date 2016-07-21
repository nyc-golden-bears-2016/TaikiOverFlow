helpers do

  def current_question
    Question.find(session[:question_id])
  end

end
