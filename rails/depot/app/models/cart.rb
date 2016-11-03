class Cart < ApplicationRecord
	#购物车Cart拥有多个在线商品LineItem，
	has_many:line_items,:dependent=>:destory
end
