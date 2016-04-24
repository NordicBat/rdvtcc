class AddTravelRefToMeals < ActiveRecord::Migration
  def change
    add_reference :meals, :travel, index: true, foreign_key: true
  end
end
