class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
      t.references :city, index: true, foreign_key: true
      t.date :initialDate
      t.date :finalDate
      t.string :description
      t.references :vehicle, index: true, foreign_key: true
      t.references :meal, index: true, foreign_key: true
      t.references :fuel, index: true, foreign_key: true
      t.references :lodging, index: true, foreign_key: true
      t.references :toll_booth, index: true, foreign_key: true
      t.decimal :finalOdometer

      t.timestamps null: false
    end
  end
end
