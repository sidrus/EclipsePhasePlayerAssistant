class Character < ActiveRecord::Base
  attr_accessible :name, :money, :items, :notes, :campaign

  belongs_to :user
  has_and_belongs_to_many :items

  def items_by_group
    items.all.group_by(&:category_name).sort
  end
end
