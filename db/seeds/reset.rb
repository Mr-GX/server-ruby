ActiveRecord::Base.connection.execute("TRUNCATE blogs")
Topic.delete_all
Topic.create(id:1,title:"Android",description:"Android社区")
Topic.create(id:2,title:"Ruby",description:"Ruby社区")
Topic.create(id:3,title:"Spring Boot",description:"Spring Boot社区")