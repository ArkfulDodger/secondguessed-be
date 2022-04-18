class AddStartTimeToImages < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :start_time, :datetime
  end
end
