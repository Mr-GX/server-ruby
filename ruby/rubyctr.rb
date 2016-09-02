#ruby 条件判断 false、nil为假，其余为真

#puts("控制语句test=#{2<2}")

=begin
#if语句（if判断语句是true时执行）
a=40
if a>10&&a<30 then
	puts("if判断结果为true")
else
	puts("if判断结果为false")
end
=end

=begin
a=10
b=20
if a>b
	puts("a大于b")
elsif a<b
	puts("a小于b")
else
	puts("a等于b")
end
=end

=begin
#unless语句（与if相反。是false时执行）
a=10
b=20
unless a<b
	puts("a大于b")
else
	puts("a小于b")
end
=end

=begin
#case语句（同一个比较对象有多种执行处理时使用）
#when判断值是否相等时是使用的===运算，即String===item
#===还可以与=~用来正则匹配，或判断右边的对象是否属于左边的类
ary=["a",1,nil]
ary.each do |item|
	case item
	when String
		puts("item is a String")
	when Numeric
		puts("item is a Numeric")
	else
		puts("item is something")
	end
end
=end

#if和unless修饰符，写在执行代码的后面
a,b=20,10
puts("a大于b") if a>b
puts("a大于b") unless a<=b