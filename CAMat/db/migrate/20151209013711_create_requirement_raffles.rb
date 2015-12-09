class CreateRequirementRaffles < ActiveRecord::Migration
  def change
    create_table :requirement_raffles do |t|
      t.DateTime :finish
      t.DateTime :start
      t.string :locker_code

      t.timestamps
    end
  end
end
