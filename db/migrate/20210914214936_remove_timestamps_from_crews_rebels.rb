class RemoveTimestampsFromCrewsRebels < ActiveRecord::Migration[6.1]
  def change
    remove_column :crews_rebels, :created_at
    remove_column :crews_rebels, :updated_at
  end
end
