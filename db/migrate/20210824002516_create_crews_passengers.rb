class CreateCrewsPassengers < ActiveRecord::Migration[6.1]
  def change
    create_table :crews_passengers do |t|
      t.integer :crew_id
      t.integer :user_id

      t.timestamps
    end
  end
end
