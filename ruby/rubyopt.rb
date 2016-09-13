#ruby 运算符
=begin
1.+、-、*、/、%、**(指数运算)
2.==、!=、>、<、>=、<=、<=>(相等0，左大于右1，反之)、===（case语句中when子句内相等(1..10)===5为true）、eql?（类型和值均相等）、equal?（存储地址相等）
3.赋值运算符：=、(+、-、*、/、%、**)=左操作数运算右操作数赋值给左操作数  对象必须同时实现reader和writer存取方法
4.并行赋值运算符：a,b,c=1,2,3    a,b=b,c
=end

#可以重定义的一元运算符+ - ~ ！分别已加@为方法名进行方法的定义
#二元运算符  定义时会将运算符名作为方法名运算符左侧为接收者，右侧为方法的参数
#下标方法  数组、散列中的obj[i]及obj[i]=x这样的方法 定义下标方法时的方法名分别为[] []=
class Point
	attr_accessor :x,:y
	def initialize(x=0,y=0)
		@x,@y=x,y
	end
	def inspect #用于显示,内部使用p方法进行输出
		"(#{x},#{y})"
	end
	def +(other) #定义二元运算符时常把参数定义为other
		self.class.new(x+other.x,y+other.y) #或Point.new()但返回的是Point类的对象，如果子类使用+ -方法时返回的也是Point类的对象，而不是子类的对象，不够灵活
	end
	def -(other)
		self.class.new(x-other.x,y-other.y)
	end

	def +@
		dup #返回自己的副本
	end
	def -@
		self.class.new(-x,-y)
	end
	def ~@
		self.class.new(-y,x)
	end
	def [](index)
		case index
		when 0
			x
		when 1
			y
		else
			raise ArgumentError,"out of range '#{index}'"
		end
	end
	def []=(index,var)
		case index
		when 0
			self.x=var
		when 1
			self.y=var
		else
			raise ArgumentError,"out of range '#{index}'"
		end
	end
	public :[]=
end

point1=Point.new(3,6)
point2=Point.new(1,8)
p(point1)
p(point2)
p(point1+point2)
p(point1-point2)
p(+point1)
p(-point1)
p(~point1)
p(point1[0])
p(point1[1])
p(point1[1]=2)
p(point1[1])
p(point1[2])

=begin
逻辑运算符：and、or、&&、||、！、not
1.表达式执行顺序是从左到右
2.如果逻辑表达式的真假已确定，将不再判断剩余的表达式
3.最后一个表达式的值为整体逻辑表达式的值（最后一个表达式是执行到的表达式）
=end

#条件运算符（三元运算符）条件?表达式1:表达式2

#范围运算符：Range.new(p1,p2)或p1..p2(包括起始值和结束值)、p1...p2(包括起始值不包括结束值)
#Range对象内部可以使用succ方法根据起点值逐个生成接下来的值，其实就是返回值递归调用succ方法


#位运算符：&、|、^、~、<<、>>


=begin
返回真假值的方法要以?结尾
1.defined?运算符 已经定义、赋值、可被调用、已传递代码块true，反之nil
2.empty?字符串长度0为true，反之false
=end

#正则表达式 /模式/ =~  匹配返回匹配的位置，反之nil

#一元运算符 ::

#不能重定义的运算符:: && || .. ... ?: not = and or