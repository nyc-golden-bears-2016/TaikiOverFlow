post "/answers" do

  answer  = Answer.new(params["answer"].merge(user_id: current_user.id, question_id: current_question.id))


  if answer.save
    redirect "/questions/#{current_question.id}"
  else
    @error = ["Nothing In The Body"]
    erb  :'login/error'
  end

end
