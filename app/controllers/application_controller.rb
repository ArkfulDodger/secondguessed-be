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
end
