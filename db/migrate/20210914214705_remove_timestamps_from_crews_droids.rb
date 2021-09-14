class RemoveTimestampsFromCrewsDroids < ActiveRecord::Migration[6.1]
  def change
    remove_column :crews_droids, :created_at
    remove_column :crews_droids, :updated_at
  end
end
