class CreateGuesses < ActiveRecord::Migration[6.1]
  def change
    create_table :guesses do |t|
      t.integer :image_id
      t.integer :user_id
      t.integer :word_id

      t.timestamps
    end
  end
end
