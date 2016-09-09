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
	public :hello
end

puts(HelloModule::Version) #通过模块名访问常量
HelloModule.hello("Ruby")

include HelloModule
puts(Version)
hello("使用include方法调用模块内的方法")

#Mix-in 类include模块后，模块中定义的方法就可以作为类的实例方法供程序调用
=begin
1.使用include?方法判断类是否包含某个模块
2.类的实例在调用方法时，Ruby会按类Class、模块Module、类的父类Object顺序查找方法，并执行第一个找到的方法
3.使用ancestors或superclass方法查看类的继承关系，而superclass获取的是其直接父类
=end
class ExtendsRelation
	include HelloModule
end
ExtendsRelation.new.hello("Ruby")
p(ExtendsRelation.ancestors)
p(ExtendsRelation.superclass)

#Ruby不允许多个父类的单一继承模型，通过Mix-in保持单一继承关系和同时让多个类共享其他功能
=begin
#使用Mix-in时方法的查找顺序
1.同继承关系一样，原类中已经定义了同名的方法时，优先使用Module中的该方法。
2.在同一个类中包含多个模块时，优先使用最后一个包含的模块。
3.嵌套include时，查找顺序也是线性的。
4.相同的模块被包含两次以上时，第二次以后的会被省略。
=end
module M1
end

module M2
end

module M3
	include M2
end

class C
	include M1
	include M3
end

class C1
	include M1
	include M2
	include M1
end

p(C.ancestors) #=>[C, M3, M2, M1, Object, HelloModule, Kernel, BasicObject]
p(C1.ancestors) #=>[C1, M2, M1, Object, HelloModule, Kernel, BasicObject]

#extend方法 使用Obeject#extend方法可以实现批量定义单例方法 extend方法可以使单例类包含模块并把模块中的功能扩展到对象中
module Edition
	def edition(n)
		"#{self} 第#{n}版"
	end
end

str="Ruby基础教程"
str.extend(Edition)
puts(str.edition(4))

#类使用extend继承module相当于继承父类，其方法可以被类直接调用
#类使用include引用module后需要类的实例调用其方法（例子ExtendsRelation）