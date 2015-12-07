# -*- encoding : utf-8 -*-
class AddExpireDateToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :expire_date, :datetime
  end
end
