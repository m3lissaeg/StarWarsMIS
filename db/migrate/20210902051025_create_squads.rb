class CreateSquads < ActiveRecord::Migration[6.1]
  def change
    create_table :squads do |t|
      t.string :name
      t.references :leader, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
