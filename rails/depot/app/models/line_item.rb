class LineItem < ApplicationRecord
	#在线商品包含购物车id和商品id的引用
	#belongs_to标明line_item中数据行依赖表carts和products中的数据行
	belongs_to :product
	belongs_to :cart
end
