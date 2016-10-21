class SayController < ApplicationController
  def hello
    @time=Time.now  #实例变量。值可以传递给views下与控制器名称相同的子目录(say),然后在子目录中找到与行为名称相符的文件(hello.html.erb)
    @str1="cow"
    @str2="boy"
    @files=Dir.glob('*')
  end

  def goodbye
  end
end
