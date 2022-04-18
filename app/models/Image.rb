class Image < ActiveRecord::Base
  has_many :submitted_words, class_name: 'Word', dependent: :destroy
  has_many :submitters, through: :submitted_words

  has_many :guesses, dependent: :destroy
  has_many :guessers, through: :guesses
  has_many :guessed_words, through: :guesses
end
