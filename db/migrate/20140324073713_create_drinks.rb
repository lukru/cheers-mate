class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :location
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
