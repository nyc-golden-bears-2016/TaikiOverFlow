post '/questions/votes/:id' do

if logged_in?

  if params[:uservote] == "upvote"
    @vote = Vote.new(value: 1)
    current_question.votes << @vote
  elsif params[:uservote] == "downvote"
    @vote = Vote.new(value: -1)
    current_question.votes << @vote
  end

  if @vote.save
    redirect "/questions/#{params[:id]}"
  else
    redirect "/questions/#{params[:id]}"
  end

else
  @error = "You must login to vote"
  redirect "/questions/#{params[:id]}"
end

end


post '/answers/votes/:id' do

if logged_in?
  if params[:uservote] == "upvote"
    @vote = Vote.new(value: 1)

    Answer.find(params[:id]).votes << @vote
    # current_answer.votes << @vote

  elsif params[:uservote] == "downvote"
    @vote = Vote.new(value: -1)
  Answer.find(params[:id]).votes << @vote
    # current_answer.votes << @vote
  end

  answer_question_id = Answer.find(params[:id]).question_id


  if @vote.save
    redirect "/questions/#{answer_question_id}"
  else
    redirect "/questions/#{answer_question_id}"
  end

else
  @error = "You must login to vote"
  redirect "/questions/#{qid}"
end

end



