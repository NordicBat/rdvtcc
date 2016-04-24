class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.date :date
      t.string :type
      t.decimal :total

      t.timestamps null: false
    end
  end
end
