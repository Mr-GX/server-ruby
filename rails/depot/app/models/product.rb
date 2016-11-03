class Product < ApplicationRecord
	has_many :line_items
	#hook方法，对象生命周期某个地方，Rails自动调用的方法，当前是表示删除数据库中一个数据时执行自定义的方法
	before_destroy :ensure_not_referenced_by_any_line_item
	#商品按title排序
	#default_scope{where(:order=>'title')}
	#根据一个或多个条件验证一个或多个模型字段，:presence=>true核实每个已命名的字段都存在，并且其内容不为空
	validates :title,:image_url,:desc,:presence => true
	validates :title ,:uniqueness => true
	validates :image_url ,:format => {:with => %r(\.(gif|jpg|png)$)i,
																   	:message => 'must be a URL for GIF,JPG or PNG image',
																 		:multiline => true}
	validates :price ,:numericality => {:greater_than_or_equel_to => 0.01}

	private
	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base,'Line Items present')
			return false
		end
	end
end
