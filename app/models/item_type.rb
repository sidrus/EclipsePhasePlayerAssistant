class ItemType < ActiveRecord::Base
  attr_accessible :name, :item_category

  belongs_to :item_category
  has_many :items

  def category_name
    item_category.name
  end
end
