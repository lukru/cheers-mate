class AddCityStateColumnToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :city, :string
  end
end
