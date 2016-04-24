class AddTravelRefToLodgings < ActiveRecord::Migration
  def change
    add_reference :lodgings, :travel, index: true, foreign_key: true
  end
end
