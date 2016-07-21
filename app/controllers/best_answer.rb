put '/best_answer/:id' do

    answers = Answer.all

    answers.each do |answer|
      answer.best_answer = false
    end

    answer = answers.find(params[:id])
    answer.best_answer = true

    if answer.save
      redirect "questions/#{current_question.id}"
    else
      @error = "Blank Field"
      erb :'login/error'
    end

end



