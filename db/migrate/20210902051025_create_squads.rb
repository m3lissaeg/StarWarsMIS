class CreateSquads < ActiveRecord::Migration[6.1]
  def change
    create_table :squads do |t|
      t.string :name

      t.timestamps
    end
  end
end
