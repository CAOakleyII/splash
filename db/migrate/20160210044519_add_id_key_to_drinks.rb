class AddIdKeyToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :_id, :string
  end
end
