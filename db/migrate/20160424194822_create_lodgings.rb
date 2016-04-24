class CreateLodgings < ActiveRecord::Migration
  def change
    create_table :lodgings do |t|
      t.date :date
      t.string :hotelName
      t.string :hotelPhone
      t.decimal :total

      t.timestamps null: false
    end
  end
end
