class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Add your routes here
  get '/users' do
    User.all.to_json
  end

  get '/users/:id' do
    user = User.find_by_session_id(params[:id])
    user.to_json
  end

  post '/users' do
    user = User.create(name: params[:name], session_id: params[:session_id])
    user.to_json
  end

  patch '/users/:id' do
    user = User.find(params[:id])
    user.update(name: params[:name])

    user.to_json
  end

  get '/words' do
    Word.all.to_json
  end

  post '/words' do
    text = params[:text].downcase.gsub(/[^a-zà-ž'_#\- ]/, '').strip
    image_id = params[:image_id]
    user_id = params[:user_id]

    image = Image.find(image_id)
    user = User.find(user_id)

    word =
      if !!Word.find_by(text: text, image: image)
        'TAKEN!'
      else
        Word.create(text: text, submitter: user, image: image)
      end
    word.to_json
  end

  get '/words/:image_id' do
    # binding.pry
    image = Image.find(params[:image_id])
    words = image.submitted_words
    words.to_json(include: :guesses)
  end

  get '/current-word/:image_id/:user_id' do
    image_id = params[:image_id]
    user_id = params[:user_id]

    user = User.find(user_id)
    image = Image.find(image_id)

    word = Word.find_by(submitter: user, image: image)
    word.to_json
  end

  patch '/words/:image_id/:user_id' do
    image_id = params[:image_id]
    user_id = params[:user_id]
    text = params[:text].downcase.gsub(/[^a-zà-ž'_#\- ]/, '').strip

    image = Image.find(image_id)
    user = User.find(user_id)
    word =
      if !!Word.find_by(text: text, image: image)
        'TAKEN!'
      else
        Word.find_by(submitter: user, image: image).update(text: params[:text])
      end

    word.to_json
  end

  get '/guesses' do
    Guess.all.to_json
  end

  post '/guesses' do
    image_id = params[:image_id]
    word_id = params[:word_id]
    user_id = params[:user_id]

    user = User.find(user_id)
    image = Image.find(image_id)
    word = Word.find(word_id)

    # binding.pry
    guess = Guess.create(image: image, guessed_word: word, guesser: user)

    guess.to_json
  end

  get '/current-guess/:image_id/:user_id' do
    # binding.pry

    image_id = params[:image_id]
    user_id = params[:user_id]

    user = User.find(user_id)
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

  get '/final-words/:image_id' do
    image = Image.find(params[:image_id])
    words = image.submitted_words

    # binding.pry

    if words.count > 0
      most_voted_word = words.max_by { |word| word.guesses.count }
      most_votes = most_voted_word.guesses.count
      sorted_words = words.sort { |a, b| b.guesses.count <=> a.guesses.count }
      filtered_words =
        sorted_words.select { |word| word.guesses.count != most_votes }

      if (filtered_words.count > 0)
        winning_vote_count = filtered_words.first.guesses.count
        winning_words =
          filtered_words.select do |word|
            word.guesses.count == winning_vote_count
          end
      else
        winning_words = []
      end
    else
      winning_words = []
    end

    binding.pry

    # winners = User.where(winning_words.include?)

    return_hash = {
      words: words.to_json(include: :guesses),
      winning_words: winning_words.to_json
    }
    return_hash.to_json
  end

  get '/images' do
    Image.all.to_json
  end

  # POST new image to db from random API
  post '/images' do
    # get the image to return
    image =
      Image.find_by_start_time(params[:start_time]) ||
        Image.create(
          url: params[:url],
          alt: params[:alt],
          start_time: params[:start_time]
        )

    # destroy any images other than the 10 most recent
    images_to_keep = Image.last(20)
    Image.all.each { |img| img.destroy if !images_to_keep.include?(img) }

    # return image as json
    image.to_json
  end

  get '/images/current' do
    img = Image.all.max_by(&:start_time)

    img ? img.to_json : {}.to_json
  end

  get '/images/last' do
    Image.last.to_json
  end

  get '/images/first' do
    Image.first.to_json
  end

  get '/images/:id' do
    Image.find(params[:id]).to_json
  end

  get '/images/next/:id' do
    # binding.pry
    img = Image.find(params[:id].to_i + 1)
    img.to_json
  end
end
