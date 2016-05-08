class AddTravelRefToTollBooths < ActiveRecord::Migration
  def change
    add_reference :toll_booths, :travel, index: true, foreign_key: true
  end
end
