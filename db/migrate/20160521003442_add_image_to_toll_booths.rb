class AddImageToTollBooths < ActiveRecord::Migration
  def change
    add_column :toll_booths, :image, :string
  end
end
