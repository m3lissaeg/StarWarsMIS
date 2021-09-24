class CreateCrewsShips < ActiveRecord::Migration[6.1]
  def change
    create_table :crews_ships do |t|
      t.integer :crew_id
      t.integer :ship_id

      t.timestamps
    end
  end
end
