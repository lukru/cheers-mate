class AddLatLongColumnsToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :lat, :float
    add_column :drinks, :long, :float
  end
end
