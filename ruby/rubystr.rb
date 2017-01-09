#Ruby 字符串类 String
#1.字符串的创建 最简单的创建方式就是用""（可以显示使用\的转义字符）或''括起来

#使用%Q与%q
desc=%Q{Ruby的字符串中可以使用""和''}	#相当于""创建字符串
str=%q{Ruby,'Hello Ruby'}	#相当于''创建字符串

#使用Here Document	源于Unix的shell的一种程序写法，使用<<来创建字符串 
#<< "结束标识符"  字符串内容  结束标识符（<<后的结束标识符可以用""或''括起来，用""括住的字符串中可以使用转义字符和内嵌表达式，用''括住的字符串则会原封不动的显示，不括住的话默认是""写法）
#Here Document整体就是字符串的字面量，因此可以被赋值给变量，也可以作为方法的参数 一般把EOF和EOB作为结束标识符
10.times do |i|
	10.times do |j|
		print(<<-"EOB")
i:#{i}
j:#{j}
i*j=#{i*j}
		EOB
	end
end

#使用sprintf方法  输出某种格式的字符串
puts(printf("Hello,%d!",123),sprintf("Hello,%s!","Ruby"))

#使用`` 通过使用`命令`的形式，可以得到命令的标注输出并将其转化为字符串对象

#2.获取字符串的长度 String#length、String#size、String#bytesize方法
puts("just ruby language".length,"just ruby language".size,"just ruby language".bytesize)
#字符串是否为空empty?方法 
puts("".empty?,"ruby".empty?)

#3.字符串的索引
str="just ruby language"
puts(str[10])

#4.字符串的连接 将2个字符串合并为新的字符串（使用+）和扩展原有的字符串（使用<<和concat，而且比较效率）2中方法
hello="Hello,"
ruby="Ruby!"
str=hello+ruby
puts(str)
puts(hello<<ruby)	#原有字符串值改变
puts(hello.concat(ruby))

#5.字符串的比较 判断相等与否使用==或!=，判断相似与否一般使用正则表达式
puts("hello"=="ruby")
#字符串大小比较 大小关系不是由长度决定的而是字符编码的顺序
puts("hello">"ruby")

#6.字符串的分割 String#split(分割字符) 分割后的各项字符串以数组形式返回
p("My:Name:is:Ruby".split(":"))

#7.删除换行符的方法	String#chop(或者加!)删除字符串行末的任何字符 String#chomp(或者加!)只有行末是换行符时删除
puts("abcd".chop!(),"abcd".chomp!(),"abcde\n".chomp!())

#8.字符串的检索和置换 
#String#index（从左向右检索）或String#rindex（从右向左检索） 检索指定的字符串是否存在于某个字符串中,返回首个检索到位置index，没找到返回nil
puts("ABCBA".index("B"),"ABCBA".rindex("B"))
#String#include?方法	只是检索指定的字符串是否存在于某个字符串中，返回boolean
puts("ABCBA".include?("B"))
#String#sub(param1,param2)（只置换首次匹配的部分）和String#gsub(param1,param2)（置换所有匹配部分）	置换目标字符串中的某部分 param1用于指定希望匹配的正则表达式的模式，param2用于指定匹配部分置换的字符
str="abc defg hello"
puts(str.sub(/\s+/,""),str.gsub(/\s+/,""))

#9.字符串于数组的共同方法
#与索引操作相关的方法
puts("abcd"[1],"abcd"[1..2],"abcd"[1,2])
puts("abcd".slice!(1),"abcd".slice!(1..2),"abcd".slice!(1,2))	#删除字符串一部分并返回删除的部分
#返回Enumerator对象的方法
tmp="abcde".each_byte.collect do |byte|
	byte
end
p(tmp)
#与连接、反转相关的方法 String#concat()、+连接字符串，String#delete(或者加!)删除某字符串，String#reverse(或者加!)反转字符串
puts("abc"+"def","abc".concat("def"),"abc".delete!("b"),"abc".reverse!())

#10.其他方法 String#strip(或者加!)删除字符串开头和末尾的空白字符，String#upcase(或者加!)将字符串中小写转化为大写/大写不变，String#downcase(或者加!)将字符串中大写转化为小写/小写不变，String#swapcase(或者加!)将字符串中大小写互换，String#capitalize(或者加!)将字符串中首字母大写，其余小写
#String#tr(或者加!) 字符串置换，类似sub和gsub方法，可一次置换多个字符
puts(" abc ".strip!(),"abc".upcase!(),"ABC".downcase!(),"aBc".swapcase!(),"aBC".capitalize!())
puts("ABCDE".tr!("A-D","a-d"))

#11.字符编码的转换 String#encode(或者加!)（可以通过Encoding#name_list方法获取encode方法支持的字符编码）或使用nkf库（可以对全角/半角/假名进行转换）
puts("中文转码测试".encode!("utf-8"))	#nkf库没怎么看懂，不写了

#练习题
test1="Ruby is an object oriented programming language".delete!(" ").split("")
p(test1)
test2=test1.sort()

p(test2)
test3=test2.sort_by{|i| i.downcase}
p(test3)

tempary="Ruby is an object oriented programming language".split(" ").map{|i| i.capitalize}
test4=""
tempary.each do |item|
	test4 += (item+" ") #test4 << item+" "
end
#或直接 tempary.join(" ")
p(test4)

#test5统计字符串中字符和数量
str = "Ruby is an object oriented programming language"
count = Hash.new
str.each_char do |c|
  count[c] = 0 unless count[c]
  count[c] += 1
end
count.keys.sort.each do |c|
  printf("'%s': %s\n", c, "*" * count[c])
end