class RemoveStartTimeColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :images, :start_time
  end
end
