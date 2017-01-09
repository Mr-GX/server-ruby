#Ruby块 block：就是在调用方法时，能与参数一起传递的多个处理的集合
=begin
1.块原本只是为了循环而产生的语法结构
2.接收块的方法会执行必要次数的块，块的执行次数由方法本身决定，不需要提前指定
3.块的调用方法一般的采用形式
	对象.方法名(参数列表) do |块变量|
		希望循环的处理
	end
4.块的开头是块变量，块变量就是在执行块的时候从方法传进来的参数
=end

#块的使用方法
#1.循环 Ruby中常用块实现循环，在接收块的方法中实现了循环处理的方法称为迭代器

#数组
ary=["ruby","php","python"]
ary.each do |obj|
	puts(obj)
end
ary.each_with_index do |obj,idx|
	puts("[#{obj},#{idx}]")
end

#散列
sum=0
map={"参加费":1000,"挂件费":2000,"联欢费":3000}
map.each do |pair|
	sum += pair[1] #pair[0]是key，pair[1]是value
end
puts("费用合计：#{sum}")
#散列时块变量的多重赋值
sum1=0
map.each do |item,price|
	sum1 += price
end
puts("费用合计：#{sum1}")

#File对象的读写
file=File.open("C:/Users/InSight/Desktop/test.txt")
file.each_line do |line|
	puts(line)
end

#2.隐藏常规处理  File.open()方法使用块时，块内部处理完成跳出方法时会自动执行File.close()方法
File.open("C:/Users/InSight/Desktop/test.txt") do |file|
	file.each_line do |line|
		puts(line)
	end
end

#3.替换部分算法 
#自定义排序  以数组排序为例 Array#sort方法是对数组内排序
puts(ary.sort)
#sort方法末尾加入{}块，方法会根据块的执行结果判断元素的大小关系
puts(ary.sort{|a,b| a<=>b })
#块的最后一个表达式不是指块的最后一行表达式，而是指在块中最后执行的表达式
puts(ary.sort{|a,b| a.length<=>b.length})
#sort_by方法会使排序更效率
puts(ary.sort_by{|item| item.length})

#定义带块的方法
def total(from,to)
	result=0
	from.upto(to) do |num|	#upto方法将Integer从小到大排序
		if block_given?		#block_given?判断调用该方法时是否有块被传递给方法
			result+=yield(num)
		else
			result+=num
		end
	end
	return result
end
puts(total(1,10))
puts(total(1,10){|num| num**2})

#控制块的执行
n=total(1,10) do |num|
	if num%2 != 0
		next 0 #中断当前处理，向下执行。使用next后执行块的yield会返回，如果未指定任何参数返回nil
	end
	num
end
puts(n)

#将块封装成对象
=begin
Ruby可以把block块作为对象处理，这样块就可以在接收块的方法之外执行块，或把块交给其他方法执行
需要用到Proc对象，Proc对象是可以让块作为对象在程序中使用的类。
定义Proc对象的典型方法是调用Proc.new方法这个带块的方法。然后调用Proc对象的call方法
=end
hello=Proc.new do |name|
	puts("Hello,#{name}")
end
hello.call("Ruby")

#方法参数中加入 &block参数(也叫Proc对象参数) Ruby会自动把调用方法时传入的块封装成Proc对象
def total2(from,to,&block)
	result=0
	from.upto(to) do |num|
		if block
			result+=block.call(num)
		else
			result+=num
		end
	end
	return result
end
puts(total2(1,10))
puts(total2(1,10){|num| num**2})

#将Proc对象作为块传给其他方法处理
def call_each(ary,&block)
	ary.each(&block)
end
call_each [1,2,3] do |item|
	puts(item)
end

#局部变量和块变量  块内部的命名空间和块外部是共享的 块外部的变量也就是局部变量 块内部的变量可以与块外部的变量同名（Ruby认为是不同的变量）
x=1
y=1
ary=[1,2,3]
ary.each do |x|
	y=x
end
puts("[#{x},#{y}]")
#块内部定义的变量不能被外部访问，只能在块内部使用
#块局部变量通过在块变量后加;区分的方式来定义的块局部变量
x=y=z=0
ary=[1,2,3]
ary.each do |x;y|	#y是块局部变量，x是块变量
	y=x				#块变量x赋值给块局部变量y
	z=x				#块变量x赋值给外部局部变量z
	p([x,y,z])
end
p([x,y,z])