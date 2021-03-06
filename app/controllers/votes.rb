post '/questions/votes/:id' do

  if logged_in? && !has_voted?(current_user.id)
    if params[:uservote] == "upvote"
      @vote = Vote.new(value: 1, user_id: current_user.id)
      current_question.votes << @vote
    elsif params[:uservote] == "downvote"
      @vote = Vote.new(value: -1, user_id: current_user.id)
      current_question.votes << @vote
    end

    if request.xhr?
      return vote_count(current_question.votes).to_s
    else
      redirect "/questions/#{params[:id]}"
    end

  elsif request.xhr?
    return vote_count(current_question.votes).to_s
  else
    @error = "You must login to vote"
    redirect "/questions/#{params[:id]}"
  end

end


post '/answers/votes/:id' do

current_answer = Answer.find(params[:id])

  if logged_in? && !has_voted_on_answer?(current_user.id, current_answer)
    if params[:uservote] == "upvote"
      @vote = Vote.new(value: 1, user_id: current_user.id)
      Answer.find(params[:id]).votes << @vote
    elsif params[:uservote] == "downvote"
      @vote = Vote.new(value: -1, user_id: current_user.id)
      Answer.find(params[:id]).votes << @vote
    end

    if request.xhr?
      return vote_count(current_answer.votes).to_s
    else
      redirect "/questions/#{params[:id]}"
    end

  elsif request.xhr?
    return vote_count(current_answer.votes).to_s
  else
    @error = "You must login to vote"
    redirect "/questions/#{current_answer.question_id}"
  end

end



