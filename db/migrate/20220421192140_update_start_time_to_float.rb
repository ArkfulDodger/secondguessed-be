class UpdateStartTimeToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :images, :start_time, :float
  end
end
