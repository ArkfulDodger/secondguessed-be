class Word < ActiveRecord::Base
  belongs_to :image
  belongs_to :submitter, class_name: 'User', foreign_key: 'user_id'
  has_many :guesses
end
