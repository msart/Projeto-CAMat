# -*- encoding : utf-8 -*-
class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :msg

      t.timestamps
    end
  end
end
