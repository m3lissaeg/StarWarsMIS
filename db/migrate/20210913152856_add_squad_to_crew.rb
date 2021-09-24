class AddSquadToCrew < ActiveRecord::Migration[6.1]
  def change
    add_reference :crews, :squad, foreign_key: true
  end
end
