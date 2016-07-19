class LineItem < ActiveRecord::Base
  has_many :items
  has_one :cart, through: :items
end
