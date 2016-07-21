get '/' do
  @questions = Question.all

  erb :'/questions/index'
end

# can we delete this index rb?
