class Character < ActiveRecord::Base
  attr_accessible :name, :money

  belongs_to :user
end
