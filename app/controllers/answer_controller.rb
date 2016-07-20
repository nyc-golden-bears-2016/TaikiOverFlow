post "/answer" do
  # binding.pry
  answer  = Answer.new(params["answer"].merge(user_id: current_user, question_id: current_question))
  # add helper method to find current_question


  id = session[:question_id]
  if answer.save
    redirect "/questions/#{id}"
  else
    error
  end

end
