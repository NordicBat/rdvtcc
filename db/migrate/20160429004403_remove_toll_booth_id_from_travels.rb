class RemoveTollBoothIdFromTravels < ActiveRecord::Migration
  def change
    remove_column :travels, :toll_booth_id, :integer
  end
end
