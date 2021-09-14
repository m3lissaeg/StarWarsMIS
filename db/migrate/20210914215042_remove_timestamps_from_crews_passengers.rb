class RemoveTimestampsFromCrewsPassengers < ActiveRecord::Migration[6.1]
  def change
    remove_column :crews_passengers, :created_at
    remove_column :crews_passengers, :updated_at
  end
end
