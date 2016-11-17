#rails generate model Comment commenter:string body:text article:references
class Comment < ApplicationRecord
  # 使用 Active Record 关联可以轻易的建立两个模型之间的关系。
  # 声明评论属于文章
  belongs_to :article
end
