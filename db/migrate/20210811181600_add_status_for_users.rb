class AddStatusForUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :isBanned, :boolean, default: false
  end
end
