class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Add your routes here
  get '/' do
    { message: 'Good luck with your project!' }.to_json
  end

  post '/word' do
    text = params[:text]
    image_id = params[:image_id]
    user_ip = params[:user_ip]

    image = Image.find(image_id)
    user = User.find_by_ip_address(user_ip)

    word = Word.create(text: text, user: user, image: image)
    word.to_json
  end
end
