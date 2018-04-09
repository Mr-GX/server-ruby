class CreateArticles < ActiveRecord::Migration[5.0]
	#迁移中定义了一个名为 change 的方法，在运行迁移时执行。change 方法中定义的操作都是可逆的，Rails 知道如何撤销这次迁移操作。运行迁移后，会创建 articles 表，以及一个字符串字段和文本字段。同时还会创建两个时间戳字段，用来跟踪记录的创建时间和更新时间。
  	#使用 rake 命令运行迁移：rake db:migrate
  	#在其他环境中运行迁移，必须在命令中指明：rake db:migrate RAILS_ENV=production
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
