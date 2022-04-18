class Guess < ActiveRecord::Base
  belongs_to :image
  belongs_to :guesser, class_name: 'User', foreign_key: 'user_id'
  belongs_to :guessed_word, class_name: 'Word', foreign_key: 'word_id'
end
