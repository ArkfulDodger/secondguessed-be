class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|
      t.string :text
      t.integer :image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
