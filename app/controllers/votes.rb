post '/questions/votes/:id' do



  if logged_in? && !has_voted?(current_user.id)
    if params[:uservote] == "upvote"
      @vote = Vote.new(value: 1, user_id: current_user.id)
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

  if logged_in? && !has_voted?(current_user.id)
    if params[:uservote] == "upvote"
      @vote = Vote.new(value: 1)
      Answer.find(params[:id]).votes << @vote
    elsif params[:uservote] == "downvote"
      @vote = Vote.new(value: -1)
      Answer.find(params[:id]).votes << @vote
    end

    answer_question_id = Answer.find(params[:id]).question_id
    if @vote.save
      redirect "/questions/#{answer_question_id}"
    else
      redirect "/questions/#{answer_question_id}"
    end

  else
    @error = "You must login to vote"
    redirect "/questions/#{answer_question_id}"
  end

end



