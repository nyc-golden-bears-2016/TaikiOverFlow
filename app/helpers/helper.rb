helpers do

  def vote_count(voted)
    voted.reduce(0) {|total, vote| total += vote.value}
  end

  def has_voted?(user_id)
    current_question.votes.map{|vote| vote.user_id}.include?(user_id)
  end

  def has_voted_on_answer?(user_id, current_answer)
    current_answer.votes.map{|vote| vote.user_id}.include?(user_id)
  end


end

