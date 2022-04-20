class UpdateIpAddressToSessionId < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :ip_address, :session_id
  end
end
