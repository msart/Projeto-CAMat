# -*- encoding : utf-8 -*-
class CreateLockers < ActiveRecord::Migration
  def change
    create_table :lockers do |t|
      t.string :number
      t.string :owner

      t.timestamps
    end
  end
end
