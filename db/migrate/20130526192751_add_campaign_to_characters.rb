class AddCampaignToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :campaign, :string
  end
end
