class User < ActiveRecord::Base
  has_many :submitted_words, class_name: 'Word'
  has_many :guesses, dependent: :destroy
  has_many :guessed_words, through: :guesses
end
