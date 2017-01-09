class Article < ApplicationRecord
	# rails generate model Article title:string text:text
	#rails generate model 命令会在 db/migrate 文件夹中生成一个数据库迁移文件。迁移是一个 Ruby 类，能简化创建和修改数据库结构的操作。Rails 使用 rake 任务运行迁移，修改数据库结构后还能撤销操作。迁移的文件名中有个时间戳，这样能保证迁移按照创建的时间顺序运行。
	# 声明文章有多个评论,删除关联对象(删除一篇文章，也要删除文章中的评论)
	has_many :comments,dependent: :destroy
	#验证 标题存在并且至少5个字符。调用save方法时处理
	validates :title,presence:true,length:{minimum:5}
end
