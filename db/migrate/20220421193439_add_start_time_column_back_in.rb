class AddStartTimeColumnBackIn < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :start_time, :float
  end
end
