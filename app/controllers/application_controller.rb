class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Add your routes here
  get '/' do
    { message: 'Good luck with your project!' }.to_json
  end

  post '/words' do
    text = params[:text]
    image_id = params[:image_id]
    user_ip = params[:user_ip]

    image = Image.find(image_id)
    user = User.find_by_ip_address(user_ip)

    word = Word.create(text: text, submitter: user, image: image)
    word.to_json
  end

  get '/words/:image_id' do
    # binding.pry
    image = Image.find(params[:image_id])
    words = image.submitted_words
    words.to_json
  end

  post '/guesses' do
    image_id = params[:image_id]
    word_id = params[:word_id]
    user_ip = params[:user_IP]

    user = User.find_by_ip_address(user_ip)
    image = Image.find(image_id)
    word = Word.find(word_id)

    # binding.pry
    guess = Guess.create(image: image, guessed_word: word, guesser: user)

    guess.to_json
  end

  get '/current-guess/:image_id/:user_ip' do
    image_id = params[:image_id]
    user_ip = params[:user_ip]

    user = User.find_by_ip_address(user_ip)
    image = Image.find(image_id)

    guess = Guess.find_by(guesser: user, image: image)
    guess.to_json
  end

  patch '/guesses/:id' do
    guess = Guess.find(params[:id])
    guess.update(word_id: params[:word_id])
    guess.to_json
  end

  delete '/guesses/:id' do
    guess = Guess.find(params[:id])
    guess.destroy
    guess.to_json
  end
end
