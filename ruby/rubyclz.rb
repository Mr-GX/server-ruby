#ruby 类  类表示对象的种类  如："abc"属于String类
=begin
生成新的对象（实例）一般用类的new方法，使用class方法查询某个对象属于哪个类，使用instance_of?判断某个对象属于某个类
通过扩展已定义的拥有基本功能的类来创建新类称为继承   继承后创建的新类称为子类，被继承的类称为父类
继承能实现的功能
1.在不影响原有功能的前提下追加新功能
2.重定义原功能，使名称不同的方法产生不同的效果
3.在已有功能的基础上追加处理，扩展已有功能
BasicObject类是Ruby中所有类的父类，它定义了作为Ruby对象的最基本功能
子类与父类的关系称为"is-a关系" 使用is_a?判断对象属于某个类
=end

#类的创建
class HelloRuby
	def initialize(name="Ruby") #使用new方法实例化对象时会调用此方法
		@name=name              #初始化对象时的一些处理一般写在这  如：初始化实例变量
	end
	def hello
		puts("Hello World,I am #{@name}")
	end
end

helloRuby=HelloRuby.new
ruby=HelloRuby.new("Ruby Class Test")
helloRuby.hello
ruby.hello

#存取器 对象外部不能直接访问实例变量或对其赋值，需要通过方法来访问对象内部
class AccessorTest
	@name
	def getName
		@name
	end
	def setName(name="default")
		@name=name
	end
end

accessorTest=AccessorTest.new
print("未赋值的实例变量值：",accessorTest.getName,"\n")
accessorTest.setName("Accessor Test")
puts(accessorTest.getName)
#Ruby提供了更简便的定义方法attr_reader、attr_writer、attr_accessor 只需指定实例变量的符号Ruby会自动定义相应的存取器
class AutoAccessor
	attr_writer :name #只读setter
	attr_reader :name #只写getter
	attr_accessor :name #读写accessor
end

#特殊变量self 用来引用方法的接收者（对象或实例）
class SelfVar
	attr_accessor :name
	def test
		#@name="Ruby"    #赋值
		self.name="Ruby" #类似调用上例的setName方法
		puts("Hi,#{name}") #ruby会默认把self作为该方法的接收者
		puts("Hi,#{self.name}")
	end
end
SelfVar.new.test

#类方法 操作的对象不是实例而是类本身
#类方法的定义
=begin
class << ClassFunc #单例类定义，其中定义的方法是单例方法
	def hello(name)
		puts("#{name} Test")
  	end
end
ClassFunc.hello("Class Func")
=end
class ClassFunc
	class << self
		def hello(name)
			puts("#{name} Test")
		end
	end
end
ClassFunc.hello("Class Func")
class ClassFunc
	def ClassFunc.hello(name)
		puts("#{name} Test")
	end
	def self.hello(name)
		puts("#{name} Test")
	end
end
ClassFunc.hello("Class Func")

#常量 可以通过类名::实现外部访问
class LocalVar
	Version="1.0"
end
puts(LocalVar::Version)

#类变量 @@开头的变量 该类所有实例的共享变量
class ClassVar
  @@count=0
  def hello
  	@@count+=1
  end
  def self.count #类方法
  	@@count
  end
end
ClassVar.new.hello
puts(ClassVar.count)
ClassVar.new.hello
puts(ClassVar.count)
ClassVar.new.hello
puts(ClassVar.count)

#限制方法的调用
=begin
1.public 以实例方法的形式向外部公开该方法
2.private 在指定接收者的情况下不能调用该方法（只能使用缺省接收者的方式调用，无法从实例的外部访问）
3.protected 在同一个类中时可将该方法作为实例方法调用
public/private/protected :方法名  设定访问级别
public/private/protected 不指定参数时 以下的方法都被定义为相应的访问级别
没有指定访问级别的方法默认是public initialize方法通常被定义为private
=end
class LimitFunc
	attr_accessor :x,:y
	protected :x=,:y=
	def initialize(x=0.0,y=0.0)
		@x,@y=x,y
	end
	def pub
		puts("this is a public method")
	end
	public :pub#指定访问级别
	private    #其下方法指定访问级别
	def priv
		puts("this is a private method")
	end
end

#扩展类
#1.在原有类的基础上添加方法
class String
	def count_str
		self.split(/\s/).size
	end
end
puts("This is a base add func".count_str)

#2.继承 共同功能定义在父类，独自功能定义在子类  calss 类名 < 父类名
#默认父类Object < BasicObject 可以使用instance_methods方法返回符号形式的实例方法列表
class ExtendsClz < Array
	def [](i)
		idx=i%size
		super(idx)
	end
end
wday=ExtendsClz["金","木","水","火","土"]
puts(wday[2])
puts(wday[5])

#alias 给已经存在的方法设置别名 
#alias 别名 原名   (直接使用方法名)
#alias :别名 :原名 (使用符号名)
class AliasClz
	def hello
		"Hello"
	end
end

class AliasClz1 < AliasClz
	alias org_hello hello
	def hello
		"#{org_hello},Show Again"
	end
end
aliasObj=AliasClz1.new
puts(aliasObj.org_hello)
puts(aliasObj.hello)

#undef 删除已经存在的方法的定义 如：在子类中删除父类定义的方法时
#undef 方法名  (直接使用方法名)
#undef :方法名 (使用符号名)