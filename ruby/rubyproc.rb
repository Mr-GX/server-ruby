#Ruby Proc类
#1.Proc类：使块对象化的类
#1.1 Proc#new、lambda、对proc方法指定块  创建Proc对象 Proc#call执行块
hello1=Proc.new do |name|
	puts("Hello,#{name}")
end
hello2=proc do |name|
	puts("Hello,#{name}")
end
#lambda对参数检查更严格，lambda可以使用return将值从块中返回
#lambda另一种写法:->(块变量){处理}
hello3=lambda do |name|
	puts("Hello,#{name}")
end
hello4=->(n){return n**2}
hello5=proc do |*name|	#接收可变参数
	name.map{|i| i*2}
end
hello1.call("World")
hello2.call("Ruby")
hello3.call("Lambda")
p(hello4.call(5))
p(hello5.call(1,2,3))
p(hello5[1,2,3])

#1.2通过Proc参数接收块
def total(from,to,&block)
	result=0
	from.upto(to) do |num|
		if block
			result +=block.call(num)
		else
			result +=num
		end
	end
	return result
end
p(total(1,10))
p(total(1,10){|num| num**2})
#1.3方法to_proc的使用
#有些对象有to_proc方法，在方法中指定块时，如果以&对象的形式传递参数，对象.to_proc就会被自动调用进而生成Proc对象
# Symbol#to_proc
p(%w(32 39 78).map(&:to_i))

#2.Proc的特征
#闭包closure：像Proc对象这样将处理内容、变量等环境同时进行保存的对象

#3.Proc类的实例方法
#执行Proc对象prc prc#call(args,...) prc[args,...] prc#yield(args,...) prc#(args,...) prc===arg
prc=Proc.new{|a,b| a+b}
p(prc.call(1,2),prc[1,2],prc.yield(1,2),prc.(1,2),prc===[1,2])
#创建Proc对象时只接收一个参数时返回boolean
fizz=proc{|n| n%3==0}
buzz=proc{|n| n%5==0}
fizzbuzz=proc{|n| n%3==0&&n%5==0}
(1..100).each do |i|
	case i
	when fizzbuzz then puts "Fizz Buzz"
	when fizz then puts "Fizz"
	when buzz then puts "Buzz"
	else puts i
	end		
end
# prc#arity		返回作为call方法的参数的块变量的个数，以|*args|指定块变量返回-1
prc=Proc.new{|a,b| a+b}
prc_1=Proc.new{|*args| args}
p(prc.arity,prc_1.arity)
# prc#parameters	返回关于块变量的详细信息，为[种类,变量名]形式的数组
=begin
	变量种类
	:opt 可省略的变量
	:req 必须的变量
	:rest 以*args形式表示的变量
	:key 关键字参数形式的变量
	:keyrest 以**args形式表示的变量
	:block 块
=end
prc1=proc{|a,b| [a,b]}
prc1_1=lambda{|a,b| [a,b]}
p(prc1.parameters,prc1_1.parameters)
# prc#lambda?	判断prc是否为通过lambda定义的方法
p(prc1.lambda?,prc1_1.lambda?)
# prc#source_location	返回定义prc的程序代码的位置，为[代码文件名,行编号]形式的数组。prc由扩展库等生成，当Ruby脚本不存在时返回nil
prc2=Proc.new{nil}
prc2_1=Proc.new{|a| a*2}
p(prc2.source_location,prc2_1.source_location)

#练习题
#1.同27行处代码
def my_collect(obj, &block)
  buf = []
  obj.each do |elem|
    buf << block.call(elem)
  end
  buf
end

ary = my_collect([1,2,3,4,5]) do |i|
  i * 2
end
p ary

#2
to_class=:class.to_proc
p(to_class.call("test")) #=>String
p(to_class.call(123)) #=>Fixnum
p(to_class.call(2**1000)) #=>Bignum

#3
def accumlator
	total=0
	Proc.new do |i|
		total += i
	end
end
acc=accumlator
p(acc.call(1),acc.call(2),acc.call(3),acc.call(4))
