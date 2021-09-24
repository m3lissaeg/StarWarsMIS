class CreateCrewsDroids < ActiveRecord::Migration[6.1]
  def change
    create_table :crews_droids do |t|
      t.integer :crew_id
      t.integer :droid_id

      t.timestamps
    end
  end
end
