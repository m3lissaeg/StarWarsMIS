class AddMissionToSquad < ActiveRecord::Migration[6.1]
  def change
    add_reference :squads, :mission, foreign_key: true
  end
end
