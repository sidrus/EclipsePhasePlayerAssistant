class CreateTableCharactersItems < ActiveRecord::Migration
  def change
    create_table :characters_items do |t|
      t.integer :character_id
      t.integer :item_id
    end
  end
end
