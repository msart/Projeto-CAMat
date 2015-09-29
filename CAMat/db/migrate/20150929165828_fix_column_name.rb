class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :lockers, :number, :code
  end
end
