#Ruby 面向对象
=begin
对象：是数据或数据的集合及操作该数据的方法的组合
封装: 使对象管理的数据不能从直接从外部操作，必须要通过调用对象的方法完成（Ruby对象默认是被强制封装的）
多态：一个方法名属于多个对象且不同对象的处理结果不一样（Object类、String类的各对象调用to_s方法结果不同）
鸭子类型：对象的特征不是由其种类（类及其继承关系）决定的，而是由对象本身具有什么样的方法决定的
=end

#对参数的要求 1.能以ary[index]获取数据 2.获取的数据可以执行downcase方法
def fetch_and_downcase(ary,index)
	ary[index].downcase
end
ary=["Ruby","Python","Java","Php"]
hash={0=>"Ruby",1=>"Python",2=>"Java",3=>"Php"}
puts(fetch_and_downcase(ary,0))
puts(fetch_and_downcase(hash,2))

#面向对象示例
require "net/http"
require "uri" #URL：是URI标识符中某种特定种类的东西，是URI中的一种
url=URI.parse("http://www.ruby-lang.org/ja/")
http=Net::HTTP.start(url.host,url.port)
doc=http.get(url.path)
puts(url.scheme) #体系：URL的种类,使用哪中通讯协议
puts(url.host)	 #主机名
puts(url.port)	 #端口号
puts(url.path)	 #路径：定位服务器上管理的文件
puts(url.to_s)
puts(doc)
=begin
#调用Net::HTTP#get方法，对象内部的处理有：
1.使用主机名和端口号，与服务器建立通信（socket套接字）
2.使用路径，创建代表请求信息的Net::HTTPRequest对象
3.对套接字写入请求信息
4.从套接字中读取数据，并将其保存到代表响应信息的Net::HTTPResponse对象中
5.利用Net::HTTPResponse本身提供的功能，解析响应信息，提取文档部分并返回
=end