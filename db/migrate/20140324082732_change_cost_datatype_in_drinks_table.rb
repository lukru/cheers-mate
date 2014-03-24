class ChangeCostDatatypeInDrinksTable < ActiveRecord::Migration
  def change
    change_table :drinks do |t|
      t.remove :cost 
      t.decimal :price, precision: 5, scale: 2
    end
  end
end
