post "/answer" do
  answer  = Answer.new(body: params[:answer])

  id = session[:question_id]

  if answer.save
    redirect "/questions/#{id}"
  else
    error
  end

end
