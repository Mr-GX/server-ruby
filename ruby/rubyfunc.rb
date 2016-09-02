#ruby 方法：由对象定义的与该对象相关的操作  对象.方法名(param1,param2,...)
=begin
对象是接收者，调用方法是向接收者发送消息，调用结果是接收者接收了消息
实例方法：以这个对象（实例）为接收者的方法 1000.to_s
类方法：接收者不是对象而是类本身的方法  Array.new
函数式方法：没接收者的方法  sleep(10)
方法的标记法：类名#方法名、类名.方法名、类名::方法名
=end

def func()#无参
	puts("Hello Ruby")
end
func()

def func1(param)#有参
	puts("Hello #{param}")
end
func1("Ruby")

def func2(param,param1="Python")#有参&有默认值&从右侧指定默认值
	puts("Hello #{param},Hello #{param1}")
end
func2("Ruby")

#方法的返回值
def volume(x,y,z)
	#x*y*z
	return x*y*z #return语句可以省略，最后一个表达式结果就是方法的返回值
end
puts(volume(2,3,4))

def max(a,b)
	if a>b
		return a
	end
	b
end
puts(max(10,5))

#定义带块的方法
def yield_func
	while true
		yield
	end
end

num=1
yield_func do 
	puts("num is #{num}")
	if num>100
		break
	end
	num *= 2
end

#参数个数不确定的方法 所有参数会被封装成数组传递 不确定个数的参数将接收传递的未利用到的参数
def dymic_param_func(*param,param1)
	[param,param1]
end
p(dymic_param_func(1,2,3)) #[[1, 2], 3]