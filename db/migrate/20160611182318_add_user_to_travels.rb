class AddUserToTravels < ActiveRecord::Migration
  def change
    add_column :travels, :user, :integer
  end
end
