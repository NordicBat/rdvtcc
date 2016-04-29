class RemoveLodgingIdFromTravels < ActiveRecord::Migration
  def change
    remove_column :travels, :lodging_id, :integer
  end
end
