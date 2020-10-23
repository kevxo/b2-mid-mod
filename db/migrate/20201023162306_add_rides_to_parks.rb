class AddRidesToParks < ActiveRecord::Migration[5.2]
  def change
    add_reference :parks, :ride, foreign_key: true
  end
end
