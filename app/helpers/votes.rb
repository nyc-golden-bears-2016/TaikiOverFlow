post '/votes/:id' do

  @vote = Vote.new(params[:vote].merge(user_id: current_user, question_id: current_question, answer_id: current_answer))

  if @vote.save
    redirect '/question/:id'
  else
    redirect '/question/:id'
  end

end

