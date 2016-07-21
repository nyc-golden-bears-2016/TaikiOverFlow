helpers do

  def current_question
    Question.find(session[:question_id])
  end

  def current_answer
     Answer.find(session[:answer_id])
  end

end
