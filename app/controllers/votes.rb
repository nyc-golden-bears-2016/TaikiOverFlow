post '/votes/:id' do


  if #upvote_logic
    @vote = Vote.new(value: 1, user_id: current_user.id,question_id: current_question.id)
  else
    @vote = Vote.new(value: -1, user_id: current_user.id,question_id: current_question.id)
  end

  if @vote.save
    redirect '/question/:id'
  else
    redirect '/question/:id'
  end

end




