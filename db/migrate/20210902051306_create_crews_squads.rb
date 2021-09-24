class CreateCrewsSquads < ActiveRecord::Migration[6.1]
  def change
    create_table :crews_squads do |t|
      t.integer :crew_id
      t.integer :squad_id

      t.timestamps
    end
  end
end
