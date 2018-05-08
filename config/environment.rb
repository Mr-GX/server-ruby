# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

SERVER_NAME = "our zone"
SERVER_DESCRIPTION = "网站介绍"
SERVER_KEY_WORDS = "网站检索关键字"

USER_TYPE_BLOCKED  = 0 # 禁用
USER_TYPE_GUEST    = 1 # 游客，仅能登录和浏览，不能做任何事
USER_TYPE_INITIAL  = 1|1<<2|1<<3 # 初始用户
USER_TYPE_NORMAL   = 1|1<<1|1<<2|1<<3 # 正常用户
USER_TYPE_ADMIN    = 1|1<<1|1<<2|1<<3|1<<4|1<<5|1<<7 # 管理员