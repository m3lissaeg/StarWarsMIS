class CreateDroids < ActiveRecord::Migration[6.1]
  def change
    create_table :droids do |t|
      t.string :name
      t.string :model
      t.text :features

      t.timestamps
    end
  end
end
