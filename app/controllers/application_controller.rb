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

    # binding.pry
    word = Word.create(text: text, submitter: user, image: image)
    word.to_json
  end
end
