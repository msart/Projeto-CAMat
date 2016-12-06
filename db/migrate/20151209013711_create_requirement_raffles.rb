class CreateRequirementRaffles < ActiveRecord::Migration
  def change
    create_table :requirement_raffles do |t|
      t.datetime :finish
      t.datetime :start
      t.string :locker

      t.timestamps
    end
  end
end
