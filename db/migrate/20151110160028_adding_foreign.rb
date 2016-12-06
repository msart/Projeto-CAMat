# -*- encoding : utf-8 -*-
class AddingForeign < ActiveRecord::Migration
  def change
    add_column :raffles, :user_id, :integer
    add_column :users, :raffle_id, :integer
  end
end
