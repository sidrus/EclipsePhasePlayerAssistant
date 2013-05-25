class AddUserToCharacters < ActiveRecord::Migration
  def up
    add_column :characters, 'user_id', :integer
  end

  def down
    remove_column :characters, 'user_id', :integer
  end
end
