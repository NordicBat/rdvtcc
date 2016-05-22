class AddImageToFuels < ActiveRecord::Migration
  def change
    add_column :fuels, :image, :string
  end
end
