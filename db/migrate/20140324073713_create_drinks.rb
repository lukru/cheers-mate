class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.integer :cost
      t.string :location
      t.text :description
      t.user :references

      t.timestamps
    end
  end
end
