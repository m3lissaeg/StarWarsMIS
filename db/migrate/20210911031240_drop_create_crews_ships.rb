class DropCreateCrewsShips < ActiveRecord::Migration[6.1]
  def change
    drop_table :crews_ships
  end
end
