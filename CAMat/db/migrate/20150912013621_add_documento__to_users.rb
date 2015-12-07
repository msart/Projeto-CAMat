# -*- encoding : utf-8 -*-
class AddDocumentoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :documento, :string
  end
end
