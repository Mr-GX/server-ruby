#ruby错误处理与异常
#1.异常log显示
=begin
文件名：行号：in '方法名'：错误信息（异常类名）
	from 文件名：行号：in '方法名'
	.
	.
异常处理的优点
1.程序不需要逐个确认处理结果也能自动检查处程序错误
2.会同时报告发生错误的位置便于排查错误
3.正常和错误处理的程序可以分开书写使程序便于阅读
=end

#异常处理的写法
=begin
	begin
		可能会发生异常的处理
	rescue (=>引用异常对象的变量）可以获取异常对象 Ruby也会自动把异常对象赋值给$!(最后发生的异常对象)和$@(最后发生异常的位置信息)
		发生异常时的处理
		#retry begin以下的处理会重做一遍
	ensure
		不管是否发生异常都希望执行的处理（后处理）
	end
=end

def copy(from,to)
	src=File.open(from)
	begin  #begin ~ end 可以省略
		puts("源文件内容：#{src.read}")
		dst=File.open(to,"w")
		dst.write(src.read)
		puts("写入成功")
		dst.close
	rescue Exception1,Exception2 => e  #指定需要捕获的异常
		#指定需要捕获的异常
	rescue
		#对上述异常以外的异常处理
		retry
		puts("错误信息：#{e.message}")
	ensure
		src.close
	end
end
copy("C:/Users/InSight/Desktop/test.txt","C:/Users/InSight/Desktop/test1.txt")

#rescue修饰符 类似if和unless
puts(Integer(123)) rescue 10
puts(Integer("abc")) rescue 10

=begin
异常类
1.Ruby中所有异常都是Exception类的子类
2.rescue中指定的异常种类实际上是异常类的类名
3.rescue不指定异常类时默认捕获StandardError类及其子类
=end
#自定义异常类时一般会先定义继承StandardError类的新类，然后再继承这个新类
MyError=Class.new(StandardError)
MyError1=Class.new(MyError)


#主动抛出异常 raise方法 
=begin
调用方法
1.raise message	抛出RuntimeError异常，并把字符串作为message设置给新生成的异常对象
2.raise 异常类	抛出指定的异常
3.raise 异常类 message 抛出指定的异常，并把字符串作为message设置给新生成的异常对象
4.raise 在rescue外抛出RuntimeError，在rescue中调用时，会再次抛出最后一次发生的异常$!
=end