class AddCurrentMoneyToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :money, :float
  end
end
