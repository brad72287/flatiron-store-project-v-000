class Item < ActiveRecord::Base
  belongs_to :carts
  belongs_to :items
end
