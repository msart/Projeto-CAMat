# -*- encoding : utf-8 -*-
class AddForeignRequerimentRaffle < ActiveRecord::Migration

  def up
    add_column :requirement_raffles, :user_id, :integer
    add_column :users, :requirement_raffle_id, :integer
  end

end

