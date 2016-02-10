class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.text :instructions
      t.string :name
      t.text :summary
      t.text :ingredients

      t.timestamps
    end
  end
end
