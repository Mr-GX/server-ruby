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