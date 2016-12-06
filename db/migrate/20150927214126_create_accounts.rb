# -*- encoding : utf-8 -*-
class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :user
      t.string :locker
      t.integer :expire_date

      t.timestamps
    end
  end
end
