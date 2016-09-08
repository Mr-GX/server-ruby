#ruby模块
=begin
1.类表现的是事物的实体数据及行为处理，模块表现的只是事物的行为部分
2.模块不能拥有实例，也不能被继承
3.命名空间就是对方法、常量、类等名称进行区分管理的单位，模块提供各自独立的命名空间，各模块相同的方法名或常量会被程序认为是不同的
4.通过在模块中定义名称能解决命名冲突的问题
5.模块方法：就是用 模块名.方法名来调用模块中的方法（必须使用module_function方法指定后）
6.通过include 模块名  可以把模块内的方法名、常量名合并到当前命名空间
=end

#Mix-in就是将模块混合到类中，在定义类时include模块，其方法、常量等就能被类使用
=begin
把类共通的功能定义到module中，类似继承，但Mix-in可以更灵活的解决以下问题
1.虽然2个类拥有相似的功能，但不希望把它们作为相同的种类（Class）来考虑时
2.Ruby不支持父类的多重继承，因此无法对已经继承的类添加共通的功能的时候
=end
module MyModule
	#共通的方法
end

class MyClass1
	include MyModule
	#MyClass1独有的方法
end

class MyClass2
	include MyModule
	#MyClass2独有的方法
end


#模块的创建 module 模块名（首字母必须大写）
module HelloModule
	Version="1.0"
	def hello(name)
		puts("Hello,#{name}")
	end
	module_function :hello #指定hello方法为模块方法
end

puts(HelloModule::Version) #通过模块名访问常量
HelloModule.hello("Ruby")

include HelloModule
puts(Version)
hello("使用include方法调用模块内的方法")