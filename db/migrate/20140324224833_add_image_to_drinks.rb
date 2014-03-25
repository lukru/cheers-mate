class AddImageToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :image, :string
  end
end
