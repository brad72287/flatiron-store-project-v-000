class CartsController < ApplicationController

	def show
		@user = current_user
	end

	def checkout

		current_user.current_cart.line_items.each do |item|
  			foo = Item.find(item.item_id) 
  			foo.inventory -= item.quantity
  			foo.save 
  		end
  		former_cart = Cart.find(current_user.current_cart.id)
  		current_user.current_cart = nil
		redirect_to former_cart
	end
end
