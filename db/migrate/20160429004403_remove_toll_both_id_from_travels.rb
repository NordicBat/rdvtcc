class RemoveTollBothIdFromTravels < ActiveRecord::Migration
  def change
    remove_column :travels, :toll_both_id, :integer
  end
end
