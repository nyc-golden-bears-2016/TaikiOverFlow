post '/comments/:id' do

  answers = Answer.all


  if params[:id].to_i == current_question.id
    current_question.comments << Comment.create(params[:comment].merge(user_id: current_user))

    new_comment = current_question.comments.last

  else
    answer = answers.find(params[:id])
    answer.comments << Comment.create(params[:comment].merge(user_id: current_user))

    new_comment = answer.comments.last
  end

    if new_comment.save
      redirect "/questions/#{current_question.id}"
    else
      @error = "Blank Field"
      erb :'login/error'
    end

end
delete "/questions/:id" do
  if current_user && logged_in?
    question = Question.find(params[:id])
    user_id =  question.user_id
    question.destroy
    redirect :"/user/show/#{user_id}"
  end
end
