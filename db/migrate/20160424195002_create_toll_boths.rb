class CreateTollBoths < ActiveRecord::Migration
  def change
    create_table :toll_boths do |t|
      t.date :date
      t.decimal :total

      t.timestamps null: false
    end
  end
end
