# -*- encoding : utf-8 -*-
class RemoveExpireDateFromAccounts < ActiveRecord::Migration
  def up
    remove_column :accounts, :expire_date
  end

  def down
    add_column :accounts, :expire_date, :integer
  end
end
