class AddTravelRefToFuels < ActiveRecord::Migration
  def change
    add_reference :fuels, :travel, index: true, foreign_key: true
  end
end
