post "/answer" do

  answer  = Answer.new(params["answer"].merge(user_id: current_user, question_id: current_question))
  # add helper method to find current_question

  if answer.save
    redirect "/questions/#{current_question.id}"
