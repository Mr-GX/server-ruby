#ruby 库的引用require
#调用require方法后，ruby会检索参数指定的库并读取库的所有内容，库内容读取后才执行require方法后的操作
require "./rubylib"#库与脚本在同一个文件时用./标识文件存在当前目录
require "date"#ruby提供的标准时间库
require "pp"  #ruby提供的输出库，输出的内容会适当的换行调整输出结果
#预定义的变量分别是：检索模式和文件名称ruby rubyrequirelib.rb file rubyfile.rb
output_file_data(Regexp.new(ARGV[0]),ARGV[1])
puts("\n当前的时间是：#{Date.today}","指定输出一个时间是：#{Date.new(1990,11,03)}")
ary=[{key1:"ruby",
	  key2:"ruby test",
	  key3:"ruby test pp"
	}]
p(ary)
pp(ary)
