class ArticlesController < ApplicationController
	#rails generate controller articles

	def index
		@articles=Article.all	
	end

	def new
		@article=Article.new
	end

	def create
		#提交表单后，其中的字段以参数的形式传递给 Rails。这些参数可以在控制器的动作中使用，完成指定的操作。要想查看这些参数的内容，可以把 create 动作改成
		#render 方法接受一个简单的 Hash 为参数，这个 Hash 的键是 plain，对应的值为 params[:article].inspect。params 方法表示通过表单提交的参数，返回 ActiveSupport::HashWithIndifferentAccess 对象，可以使用字符串或者 Symbol 获取键对应的值。
		#render plain:params[:article].inspect

		#在 Rails 中，每个模型可以使用各自的属性初始化，自动映射到数据库字段上。
		#Rails 提供了很多安全防范措施保证程序的安全，以下写法违反了其中一个措施。这个防范措施叫做“健壮参数”
		#@article=Article.new(params[:article])
		
		@article=Article.new(article_params)
		#把模型保存到数据库中,关联model的验证声明
		if @article.save
			#保存完后转向 show 动作。redirect_to 会让浏览器发起一次新请求。
			redirect_to @article
		else
			#render 方法才能在保存失败后把 @article 对象传给 new 动作的视图。渲染操作和表单提交在同一次请求中完成
			render 'new'
		end
		
	end

	def show
		@article=Article.find(params[:id])	
	end

	#article_params 是私有方法。这种用法可以防止攻击者把修改后的属性传递给模型。
	private
	def article_params
		#permit方法允许在动作中使用 title 和 text 属性
		params.require(:article).permit(:title,:text)
	end

end
