class AddRaffleToUser < ActiveRecord::Migration
  def change
    add_column :users, :raffle, :belongs_to
  end
end
