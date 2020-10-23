class AddParksToRides < ActiveRecord::Migration[5.2]
  def change
    add_reference :rides, :park, foreign_key: true
  end
end
