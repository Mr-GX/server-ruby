#ruby 变量var
=begin
伪变量是特殊的变量，有着局部变量的外观，但行为却像常量。不能给这些变量赋任何值。
self: 当前方法的接收器对象。
true: 代表 true 的值。
false: 代表 false 的值。
nil: 代表 undefined 的值。
__FILE__: 当前源文件的名称。
__LINE__: 当前行在源文件中的编号。
=end
$global_var="this is a global var"#全局变量
class Test
	@@clazz_var=0#类变量 可以多次修改（必须初始化）
	VAR=100#常量
	def initialize(id,name)
		#@@clazz_var=1
		var="test"#局部变量 只能在该方法中使用
		@instance_var_id=id#实例变量，可以在同一实例中任意引用修改，未初始化时引用返回nil(与类变量有些类似)
		@instance_var_name=name#只有实例存在，实例变量的值就不会消失
		puts("test var=#{var}","test VAR=#{VAR}")
	end
	def output_instance_var
		puts("test instance_var_id=#{@instance_var_id}","test instance_var_name=#{@instance_var_name}")
	end
	def output_clazz_var
		@@clazz_var+=2
		puts("test clazz_var=#{@@clazz_var}")
	end
	def output_global_var
		puts("test global_var=#{$global_var}")
	end
end

class Test1
	def output_global_var
		puts("test1 global_var=#{$global_var}")
	end
end

test=Test.new("1","guoxin")
test.output_global_var
test.output_clazz_var
test.output_instance_var
test1=Test1.new
test1.output_global_var