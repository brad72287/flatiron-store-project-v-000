class LineItemsController < ApplicationController

	def create
		cc = current_user.current_cart
		if cc.line_items.find_by(item_id: params[:item_id])
			duplicate = cc.line_items.find_by(item_id: params[:item_id])
			duplicate.quantity += 1
			#raise duplicate.quantity.to_s
			duplicate.save
		end
		cc.line_items << cc.add_item(params[:item_id])
		cc.save
		redirect_to cc
	end

end
