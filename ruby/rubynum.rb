#Ruby数值类Numeric

#1.数值类的构成	Integer（整数）包括Fixnum（普通的整数）和Bignum（大整数）、Float（浮点小数）、Rational（有理数）、Complex（复数）
#Ruby使用的整数一般是Fixnum类范围内的，如果超过了会自动转化为Bignum类
a=Rational(1,3)	#有理数Rational(分子，分母)
b=Rational(2,5)
c=Complex(0,2)	#复数Complex(实数，虚数)
d=a+b
puts(c)
puts(d)
puts(d.to_f)

#2.数值的字面量  其中的——会被自动忽略
#以0b开头的数值表示2进制，以0或0o开头的数值表示8进制，单纯的数字罗列或0d开头的数值表示10进制，以0x开头的数值表示16进制
#科学记数法格式：有效数字+e或E+表示指数的整数  1.234e4 =>12340.0

#3.算数运算
#Integer和Float对象间运算结果为Float对象，各对象间运算结果还是该数值类对象.指数为负整数的乘方运算结果是有理数对象
puts(1+1)
puts(1+1.0)
puts(1.0+1.0)
puts(5**-2.0)
puts(5**-2)

#除法 除了/和%外，数值对象中的一些与除法相关的方法
puts(100.div(8))	#=>12 x÷y的商的整数
puts(100.quo(8.0))  #=>12.5	x÷y的商
puts(100.quo(8))	#=>25/2  xy都是整数返回有理数Rational对象
puts(100.modulo(8)) #=>4 等价于%
p(100.divmod(8)) 	#=>[12,4] x÷y的商和余数作为数组返回
puts(100.remainder(8))	#=>4 x÷y的余数，其符号与x符号一致
puts(-100.remainder(8))	#=>-4 x÷y的余数，其符号与x符号一致

#4.Math模块 提供了三角函数、对数函数等常用的函数运算方法，该模块中定义了模块函数和常量
puts(Math.sqrt(2))
include Math
puts(PI,E)

#5.数值类型转换	Integer#to_f Float#to_i Float#to_r  Float#to_c  
puts(100.to_f)
puts(100.111.to_i)	#去掉小数点以后的值
puts(1.5.to_r)
puts(1.5.to_c)
puts(1.5.round)		#对小数点后的四舍五入
puts(1.5.ceil,1.5.floor)	#比1.5大的最小整数，比1.5小的最大整数

#6.位运算 Integer类 位是计算机中的最小数据单位，即0或1
printf("%08b\n",0b11110000&0b11111111)

#7.随机数 Random#rand
puts(Random.rand)	#返回比1小的浮点小数
puts(Random.rand(100))	#返回0到该正整数之间的数值
#程序不能生成真正的随机数，而是通过某种算法生成看起来像随机数的值，这就是模拟随机数
#生成模拟随机数需要一个值为基础，这个值就是随机数种子
r=Random.new(1)	#初始化随机数组
puts("[#{r.rand},#{r.rand}]")

#8.计数 Integer类除了数值计数外还能计算处理的次数、数组的元素个数等
ary=[]
10.times do |i|	#n.times 循环n次，从0到n-1依次赋值给块变量
	ary<<i
end
p(ary)

ary1=[]
2.upto(10) do |i| #from.upto(to) 从from开始对i+1，直到i=to
	ary1<<i
end
p(ary1)

ary2=[]
10.downto(2) do |i| #from.downto(to) 从from开始对i-1，直到i=to
	ary2<<i
end
p(ary2)

ary3=[]
10.step(2,-1) do |i| #from.step(to,step) 从from开始对i+step，直到i=to
	ary3<<i
end
p(ary3)

#9.近似值误差 处理浮点小数很容易因误差产生问题
a=0.1+0.2
b=0.3
puts(a==b)
#可以把浮点小数转换为有理数Rational表示就可以避免近似值误差
a=Rational(1,10)+Rational(2,10)
b=Rational(3,10)
puts(a==b)

#小练习
def cels2fahr
	1.step(100,1) do |i|
		puts(i*9/5+32)
		puts(Random.rand(6))
	end
end
cels2fahr