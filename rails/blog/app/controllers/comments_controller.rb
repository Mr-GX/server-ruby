# rails generate controller Comments
class CommentsController < ApplicationController
	# 只有通过认证的用户才能进行删除操作
	http_basic_authenticate_with name: "guoxin", password: "12345678", only: :destroy
	def create
		# 因为设置了嵌套关系，必须这么做评论功能才能使用。发布评论时要知道这个评论属于哪篇文章，所以要在 Article 模型上调用 find 方法查找文章对象。
		# 而且，这段代码还充分利用了关联关系生成的方法。我们在 @article.comments 上调用 create 方法，创建并保存评论。这么做能自动把评论和文章联系起来，让这个评论属于这篇文章。
		@article=Article.find(params[:article_id])
		@comment=@article.comments.create(comment_params)
		redirect_to @article
	end

	def destroy
		@article = Article.find(params[:article_id])
    	@comment = @article.comments.find(params[:id])
    	@comment.destroy
    	redirect_to @article
	end

	private
	def comment_params
		params.require(:comment).permit(:commenter,:body)
	end
end
