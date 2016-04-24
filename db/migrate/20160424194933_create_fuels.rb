class CreateFuels < ActiveRecord::Migration
  def change
    create_table :fuels do |t|
      t.date :date
      t.decimal :total

      t.timestamps null: false
    end
  end
end
