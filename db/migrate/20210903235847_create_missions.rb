class CreateMissions < ActiveRecord::Migration[6.1]
  def change
    create_table :missions do |t|
      t.date :start_date
      t.date :end_date
      t.text :details
      t.integer :status
      t.references :commander, foreign_key: { to_table: :users}
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
