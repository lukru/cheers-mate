class ChangeCostDatatypeInDrinksTable < ActiveRecord::Migration
  def change
    change_table :drinks do |t|
      t.decimal :price, precision: 8, scale: 2
    end
  end
end
