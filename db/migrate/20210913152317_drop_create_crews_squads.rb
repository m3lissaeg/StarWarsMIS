class DropCreateCrewsSquads < ActiveRecord::Migration[6.1]
  def change
    drop_table :crews_squads
  end
end
