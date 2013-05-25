class Item < ActiveRecord::Base
  attr_accessible :description, :item_type, :name

  belongs_to :item_type
  has_and_belongs_to_many :characters

  def type_name
    item_type.name
  end

  def category_name
    item_type.category_name
  end
end
