class AddTravelRefToTollBoths < ActiveRecord::Migration
  def change
    add_reference :toll_boths, :travel, index: true, foreign_key: true
  end
end
