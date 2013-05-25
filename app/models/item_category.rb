class ItemCategory < ActiveRecord::Base
  attr_accessible :name

  has_many :item_types
end
