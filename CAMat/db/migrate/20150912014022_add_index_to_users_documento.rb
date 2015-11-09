class AddIndexToUsersDocumento < ActiveRecord::Migration
  def change
  	add_index :users, :documento, unique: true
  end
end
