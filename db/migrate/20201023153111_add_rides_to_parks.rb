class AddRidesToParks < ActiveRecord::Migration[5.2]
  def change
    add_reference :parks, :rides, foreign_key: true
  end
end
