# -*- encoding : utf-8 -*-
class AddForeignRequerimentRaffle < ActiveRecord::Migration

  def change
    add_column :requeriment_raffles, :user_id, :integer
    add_column :users, :requeriment_raffle_id, :integer
  end

end

