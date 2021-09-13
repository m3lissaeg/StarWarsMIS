class AddShipToCrew < ActiveRecord::Migration[6.1]
  def change
    add_reference :crews, :ship, foreign_key: true
  end
end
