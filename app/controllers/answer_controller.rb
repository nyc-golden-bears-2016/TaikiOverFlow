post "/answer" do
  # binding.pry
  answer  = Answer.new(params["answer"])

  id = session[:question_id]
  if answer.save
    redirect "/questions/#{id}"
  else
    error
  end

end
