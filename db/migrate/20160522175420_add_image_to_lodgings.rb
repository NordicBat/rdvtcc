class AddImageToLodgings < ActiveRecord::Migration
  def change
    add_column :lodgings, :image, :string
  end
end
