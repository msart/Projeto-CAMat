# -*- encoding : utf-8 -*-
class CreateRaffles < ActiveRecord::Migration
  def change
    create_table :raffles do |t|
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end
  end
end
