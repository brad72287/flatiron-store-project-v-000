class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
  	cost = 0
  	line_items.each do |thing|
  		cost+=(thing.item.price * thing.quantity)
  	end
  	cost
  end

  def add_item(item_id)
  	@line_item = LineItem.find_or_initialize_by(item: Item.find(item_id), cart: self)
  end
end
